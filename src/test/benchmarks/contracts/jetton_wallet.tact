import "@stdlib/ownable";
import "./messages";

contract JettonWallet with Ownable {
    balance: Int as coins;
    owner: Address;
    master: Address;
    const minTonsForStorage: Int = ton("0.015"); // 0.01 TON in original funC implementation. Increased as we have approx. x2 code size
    const gasConsumption: Int = ton("0.015"); // 0.015 TON in original funC implementation. 0.13 TON is Howard's constant
    // According to tests, 23k gas is maximum gas consumption in transfer. 23k gas is 0.0092 TON
    // More precisely, max gas I could get is 22725
    init(owner: Address, master: Address) {
        self.balance = 0;
        self.owner = owner;
        self.master = master;
    }


    receive(msg: JettonTransfer) {
        self.requireOwner();

        let totalFees: Int = (2 * context().readForwardFee() + 2 * self.gasConsumption) + self.minTonsForStorage + msg.forwardTonAmount;

        //Context() returns Structure with info about incoming message
        //require(context().value > totalFees, "insufficient amount of TON attached");
        self.balance -= msg.amount;

        //coins type is unsigned type, so
        //self.balance is unsigned when storing and loading (msg.amount is unsigned too),
        //however when doing calculations it's value may be negative, so the check is correct
        require(self.balance >= 0, "Invalid balance");


        //We shouldn't send transfers to masterchain due to higher gas price
        require(parseStdAddress(msg.destination.asSlice()).workchain == 0, "Invalid workchain of destination address");

        let init: StateInit = initOf JettonWallet(msg.destination, self.master);
        let walletAddress: Address = contractAddress(init);

        send(SendParameters{
            to: walletAddress,
            value: 0,
            mode: SendRemainingValue,
            bounce: true,
            body: JettonTransferInternal {
            queryId: msg.queryId,
                amount: msg.amount,
                sender: self.owner,
                responseDestination: msg.responseDestination,
                forwardTonAmount: msg.forwardTonAmount,
                forwardPayload: msg.forwardPayload
            }.toCell(),
            code: init.code,
            data: init.data
        });
    }

    receive(msg: JettonTransferInternal) {
        // This message should come only from master, or from other JettonWallet
        if (sender() != self.master) {
            let init: StateInit = initOf JettonWallet(msg.sender, self.master);
            require(contractAddress(init) == sender(), "Sender is not another JettonWallet or JettonMaster");
        }
        // Update balance
        self.balance += msg.amount;

        //Commented require() here because self.balance and msg.amount are coins, so they are unsigned
        //require(self.balance >= 0, "Invalid balance");
        // Get value for gas

        let ctx: Context = context(); //Context of current message
        let msgValue: Int = ctx.value;
        let tonBalanceBeforeMsg = myBalance() - msgValue;
        let storageFee = self.minTonsForStorage - min(tonBalanceBeforeMsg, self.minTonsForStorage);
        msgValue -= (storageFee + self.gasConsumption);

        let fwd_fee: Int = ctx.readForwardFee();


        if (msg.forwardTonAmount > 0) {
            msgValue = ((msgValue - msg.forwardTonAmount) - fwd_fee);
            send(SendParameters{
                to: self.owner,
                value: msg.forwardTonAmount,
                mode: SendPayGasSeparately,
                bounce: false,
                body: JettonNotification{ // 0x7362d09c -- Remind the new Owner
                    queryId: msg.queryId,
                    amount: msg.amount,
                    sender: msg.sender,
                    forwardPayload: msg.forwardPayload
            }.toCell()
            });
        }
        // 0xd53276db -- Cashback to the original Sender
        if (msg.responseDestination != null && msgValue > 0) {
            send(SendParameters{
                to: msg.responseDestination!!,
                value: msgValue,
                mode: SendIgnoreErrors, // Jetton transfer is already succeeded, Here was only PayGasSeparately in Howard's code
                //In official funC implementation it is SendIgnoreErrors
                bounce: false,
                body: JettonExcesses{
                    queryId: msg.queryId
                }.toCell()
            });
        }
    }

    receive(msg: JettonBurn){
        self.requireOwner();

        self.balance -= msg.amount; // Update balance
        require(self.balance >= 0, "Invalid balance after burn");

        // This is minimal possible amount of TONs for attached. But still, maybe we should increase it?
        //require(ctx.value > ton("0.011217199"), "Too little TONs for gas attached");

        //let fwd_fee: Int = ctx.readForwardFee(); // Gas checks
        //require(ctx.value > ((fwd_fee + 2 * self.gasConsumption) + self.minTonsForStorage), "Invalid value - Burn");
        // Burn tokens
        send(SendParameters{
            to: self.master,
            value: 0,
            mode: SendRemainingValue,
            bounce: true,
            body: JettonBurnNotification{
                queryId: msg.queryId,
                amount: msg.amount,
                sender: self.owner,
                responseDestination: msg.responseDestination
                }.toCell()
        }
        );
    }

    bounced(msg: bounced<JettonTransferInternal>){
        self.balance += msg.amount;
    }

    bounced(msg: bounced<JettonBurnNotification>){
        self.balance += msg.amount;
    }

    get fun get_wallet_data(): JettonWalletData {
        return JettonWalletData{
        balance: self.balance,
        owner: self.owner,
        master: self.master,
        code: myCode() //may be replaced by "initOf JettonDefaultWallet(self.owner, self.master).code"
        };
    }
}
