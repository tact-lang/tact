import "@stdlib/deploy";
import "./messages";

fun calculateJettonWalletAddress(owner: Address, master: Address, code: Cell): Address {
    let initData = JettonWalletData{balance: 0, owner, master, code};
    return contractAddress(StateInit{code: code, data: initData.toCell()});
}

message UpdateJettonWalletCode {
    newJettonWalletCode: Cell;
}
message TakeEscrowData {
    escrowData: EscrowData;
}
struct EscrowData {
    id: Int as uint32; // contract address salt
    sellerAddress: Address;
    guarantorAddress: Address;
    dealAmount: Int as coins;
    guarantorRoyaltyPercent: Int as uint32; // 3 decimal points, see GUARANTOR_PERCENT_CONST
    isFunded: Bool;
    assetAddress: Address?; // null for TON
    jettonWalletCode: Cell?;
    buyerAddress: Address?; // null if not funded, set after funding
}

contract Escrow with Deployable {
    id: Int as uint32;
    sellerAddress: Address;
    guarantorAddress: Address;
    buyerAddress: Address?;
    dealAmount: Int as coins;
    guarantorRoyaltyPercent: Int as uint32;
    isFunded: Bool;
    assetAddress: Address?;
    jettonWalletCode: Cell?;

    const GUARANTOR_PERCENT_CONST: Int = 100000;
    const GUARANTOR_PERCENT_MAX: Int = 90000;
    const JETTON_TRANSFER_GAS: Int = ton("0.05");
    const TON_TRANSFER_GAS: Int = ton("0.015");
    
    init(id: Int,
        sellerAddress: Address,
        guarantorAddress: Address,
        dealAmount: Int,
        guarantorRoyaltyPercent: Int,
        assetAddress: Address?,
        jettonWalletCode: Cell?){
        self.id = id;
        self.sellerAddress = sellerAddress;
        self.guarantorAddress = guarantorAddress;
        self.dealAmount = dealAmount;
        self.guarantorRoyaltyPercent = guarantorRoyaltyPercent;
        self.assetAddress = assetAddress;
        self.jettonWalletCode = jettonWalletCode;
        self.isFunded = false;
        self.buyerAddress = null;
    }

    fun sendJettons(receiver: Address, amount: Int, mode: Int) {
        let escrowJettonWalletAddress = calculateJettonWalletAddress(myAddress(),
            self.assetAddress!!,
            self.jettonWalletCode!!
        );
        send(SendParameters{
                to: escrowJettonWalletAddress,
                value: self.JETTON_TRANSFER_GAS,
                body: JettonTransfer{
                    queryId: 0,
                    amount: amount,
                    destination: receiver,
                    responseDestination: receiver,
                    forwardTonAmount: ton("0.01"),
                    forwardPayload: emptySlice(),
                    customPayload: null
                }.toCell(),
                mode: mode
            }
        );
    }

    receive("funding"){
        require(self.isFunded == false, "already funded");
        require(self.assetAddress == null, "wrong asset type");

        let ctx: Context = context();
        require(ctx.value == self.dealAmount, "wrong fund amount");

        self.isFunded = true;
        self.buyerAddress = ctx.sender;
    }

    receive(msg: UpdateJettonWalletCode){
        require(self.isFunded == false, "already funded");
        require(self.assetAddress != null, "wrong asset type");
        require(self.sellerAddress == context().sender, "only seller can change wallet code");

        self.jettonWalletCode = msg.newJettonWalletCode;
    }

    receive(msg: JettonNotification){
        require(self.isFunded == false, "already funded");
        require(self.assetAddress != null, "wrong asset type");
        require(self.jettonWalletCode != null, "empty jetton wallet code");

        let escrowJettonWalletAddress = calculateJettonWalletAddress(myAddress(),
            self.assetAddress!!,
            self.jettonWalletCode!!
        );

        require(sender() == escrowJettonWalletAddress, "notification not from escrow jetton wallet");
        require(self.dealAmount == msg.amount, "wrong fund amount");

        self.isFunded = true;
        self.buyerAddress = msg.sender;
    }

    // send funds to seller and royalty to guarantor
    receive("approve"){
        require(self.isFunded == true, "not funded");
        let ctx: Context = context();

        require(self.guarantorAddress == ctx.sender, "not guarantor");
        let royaltyAmount: Int = self.calculateRoyaltyAmount();

        if (self.assetAddress == null) {
            require(ctx.value > (2 * self.TON_TRANSFER_GAS), "low msg value");
            send(SendParameters{
                    to: self.sellerAddress,
                    value: self.dealAmount - royaltyAmount,
                    mode: SendPayGasSeparately
                }
            );
            send(SendParameters{
                    to: self.guarantorAddress,
                    value: royaltyAmount,
                    mode: SendRemainingBalance | SendDestroyIfZero // send all remaining and destroy escrow
                }
            );
        } else {
            require(ctx.value > (2 * self.JETTON_TRANSFER_GAS), "low msg value");
            self.sendJettons(self.sellerAddress, self.dealAmount - royaltyAmount, SendPayGasSeparately);
            self.sendJettons(self.guarantorAddress, royaltyAmount, SendRemainingBalance | SendDestroyIfZero);
        }
    }

    // send funds back to buyer
    receive("cancel"){
        require(self.isFunded == true, "not funded");
        let ctx: Context = context();
        require(self.guarantorAddress == ctx.sender, "not guarantor");
        // it's up to business logic to decide if guarantor gets royalty in case of cancel
        // in this implementation we don't pay royalty in case of cancel
        if (self.assetAddress == null) {
            send(SendParameters{
                    to: self.buyerAddress!!,
                    value: self.dealAmount,
                    mode: SendRemainingBalance | SendDestroyIfZero // send all remaining and destroy escrow
                }
            );
        } else {
            self.sendJettons(self.buyerAddress!!, self.dealAmount, SendRemainingBalance | SendDestroyIfZero);
        }
    }

    // on-chain data access, could be useful to guarantor contract
    receive("provideEscrowData"){
        self.reply(TakeEscrowData{escrowData: self.escrowInfo()}.toCell());
    }

    get fun calculateRoyaltyAmount(): Int {
        // using integer math to avoid floating point issues
        // see https://tact-by-example.org/04-decimal-point
        let percent: Int = self.guarantorRoyaltyPercent;

        if (percent >= self.GUARANTOR_PERCENT_MAX) {
            percent = self.GUARANTOR_PERCENT_MAX;
        }

        return (self.dealAmount * percent) / self.GUARANTOR_PERCENT_CONST;
    }

    get fun walletAddress(): Address {
        return calculateJettonWalletAddress(myAddress(), self.assetAddress!!, self.jettonWalletCode!!);
    }

    get fun escrowInfo(): EscrowData {
        return
            EscrowData{
                id: self.id,
                sellerAddress: self.sellerAddress,
                guarantorAddress: self.guarantorAddress,
                dealAmount: self.dealAmount,
                guarantorRoyaltyPercent: self.guarantorRoyaltyPercent,
                isFunded: self.isFunded,
                assetAddress: self.assetAddress,
                jettonWalletCode: self.jettonWalletCode,
                buyerAddress: self.buyerAddress
            };
    }
}