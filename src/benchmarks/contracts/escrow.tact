import "./messages";

inline fun calculateJettonWalletAddress(owner: Address, master: Address, code: Cell): Address {
    let initData = JettonWalletData{balance: 0, owner, master, code};
    return contractAddress(StateInit{code: code, data: initData.toCell()});
}

inline fun calculateJettonBasechainWalletAddress(owner: Address, master: Address, code: Cell): BasechainAddress {
    let initData = JettonWalletData{balance: 0, owner, master, code};
    return contractBasechainAddress(StateInit{code: code, data: initData.toCell()});
}

message(0x9eacde91) UpdateJettonWalletCode {
    newJettonWalletCode: Cell;
}
message TakeEscrowData {
    escrowData: EscrowData;
}

message(0x9451eca9) Funding {}
message(0xe8c15681) Approve {}
message(0xcc0f2526) Cancel {}
message(0xc33b3126) ProvideEscrowData {}

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

contract Escrow (
    id: Int as uint32,
    sellerAddress: Address,
    guarantorAddress: Address,
    buyerAddress: Address?,
    dealAmount: Int as coins,
    guarantorRoyaltyPercent: Int as uint32,
    isFunded: Bool,
    assetAddress: Address?,
    jettonWalletCode: Cell?,
) {

    const GUARANTOR_PERCENT_CONST: Int = 100000;
    const GUARANTOR_PERCENT_MAX: Int = 90000;
    const JETTON_TRANSFER_GAS: Int = ton("0.05");
    const TON_TRANSFER_GAS: Int = ton("0.015");
    
    fun sendJettons(receiver: Address, amount: Int, mode: Int) {
        let escrowJettonWalletAddress = calculateJettonWalletAddress(myAddress(),
            self.assetAddress!!,
            self.jettonWalletCode!!
        );
        message(MessageParameters{
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

    receive(_: Funding) {
        throwIf(400, self.isFunded);
        throwUnless(400, self.assetAddress == null);
        
        let ctx: Context = context();
        throwUnless(401, ctx.value == self.dealAmount);

        self.isFunded = true;
        self.buyerAddress = ctx.sender;
    }

    receive(msg: UpdateJettonWalletCode) {
        throwIf(400, self.isFunded);
        throwIf(400, self.assetAddress == null);
        throwUnless(403, self.sellerAddress == sender());

        self.jettonWalletCode = msg.newJettonWalletCode;
    }

    receive(msg: JettonNotification) {
        throwUnless(400, !self.isFunded);
        throwUnless(400, self.assetAddress != null);

        let escrowJettonWalletAddress = calculateJettonBasechainWalletAddress(myAddress(),
            self.assetAddress!!,
            self.jettonWalletCode!!
        );
        let sender = parseStdAddress(sender().asSlice());

        throwUnless(74, sender.workchain == 0 && sender.address == escrowJettonWalletAddress.hash!!);

        throwUnless(401, self.dealAmount == msg.amount);

        self.isFunded = true;
        self.buyerAddress = msg.sender;
    }

    // send funds to seller and royalty to guarantor
    receive(_: Approve) {
        throwUnless(403, self.isFunded);

        let ctx: Context = context();

        throwUnless(403, self.guarantorAddress == ctx.sender);
        let percent: Int = max(self.guarantorRoyaltyPercent, self.GUARANTOR_PERCENT_MAX);
        let royaltyAmount: Int = muldivc(percent, self.dealAmount, self.GUARANTOR_PERCENT_CONST);

        if (self.assetAddress == null) {
            throwUnless(404, ctx.value > (2 * self.TON_TRANSFER_GAS));
            message(MessageParameters{
                    to: self.sellerAddress,
                    value: self.dealAmount - royaltyAmount,
                    mode: SendPayGasSeparately
                }
            );
            message(MessageParameters{
                    to: self.guarantorAddress,
                    value: royaltyAmount,
                    mode: SendRemainingBalance | SendDestroyIfZero // send all remaining and destroy escrow
                }
            );
        } else {
            throwUnless(404, ctx.value > (2 * self.JETTON_TRANSFER_GAS));
            self.sendJettons(self.sellerAddress, self.dealAmount - royaltyAmount, SendPayGasSeparately);
            self.sendJettons(self.guarantorAddress, royaltyAmount, SendRemainingBalance | SendDestroyIfZero);
        }
    }

    // send funds back to buyer
    receive(_: Cancel) {
        throwUnless(403, self.isFunded);
        throwUnless(403, self.guarantorAddress == sender());

        // it's up to business logic to decide if guarantor gets royalty in case of cancel
        // in this implementation we don't pay royalty in case of cancel
        if (self.assetAddress == null) {
            message(MessageParameters{
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
    receive(_: ProvideEscrowData) {
        message(MessageParameters{
            bounce: false,
            value: 0,
            to: sender(),
            body: TakeEscrowData{
                escrowData: EscrowData {
                    id: self.id,
                    sellerAddress: self.sellerAddress,
                    guarantorAddress: self.guarantorAddress,
                    dealAmount: self.dealAmount,
                    guarantorRoyaltyPercent: self.guarantorRoyaltyPercent,
                    isFunded: self.isFunded,
                    assetAddress: self.assetAddress,
                    jettonWalletCode: self.jettonWalletCode,
                    buyerAddress: self.buyerAddress
                }
            }.toCell(),
            mode: SendRemainingValue
        });
    }

    get fun calculateRoyaltyAmount(): Int {
        // using integer math to avoid floating point issues
        // see https://tact-by-example.org/04-decimal-point
        let percent: Int = max(self.guarantorRoyaltyPercent, self.GUARANTOR_PERCENT_MAX);

        return muldivc(percent, self.dealAmount, self.GUARANTOR_PERCENT_CONST);
    }

    get fun walletAddress(): Address {
        return calculateJettonWalletAddress(myAddress(), self.assetAddress!!, self.jettonWalletCode!!);
    }

    get fun escrowInfo(): Escrow {
        return self;
    }
}
