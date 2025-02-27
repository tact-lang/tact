import "./messages";

contract JettonWallet(
    balance: Int as coins,
    owner: Address,
    master: Address,
) {
    const minTonsForStorage: Int = ton("0.01");
    const gasConsumption: Int = ton("0.015");

    receive(msg: JettonTransfer) {
        throwUnless(333, parseStdAddress(msg.destination.asSlice()).workchain == 0);
        throwUnless(705, sender() == self.owner);
        self.balance -= msg.amount;
        throwUnless(706, self.balance >= 0);
        throwUnless(708, msg.forwardPayload.bits() >= 1);

        let ctx = context();
        let fwdCount = msg.forwardTonAmount > 0 ? 2 : 1;
        throwUnless(709, ctx.value >
            msg.forwardTonAmount +
            fwdCount * muldivc(fwdFee(ctx.raw), 3, 2) +
            (2 * self.gasConsumption + self.minTonsForStorage)
        );

        deploy(DeployParameters{
            value: 0,
            mode: SendRemainingValue,
            bounce: true,
            body: JettonTransferInternal{
                queryId: msg.queryId,
                amount: msg.amount,
                sender: self.owner,
                responseDestination: msg.responseDestination,
                forwardTonAmount: msg.forwardTonAmount,
                forwardPayload: msg.forwardPayload
            }.toCell(),
            init: initOf JettonWallet(0, msg.destination, self.master),
        });
    }

    receive(msg: JettonTransferInternal) {
        // Update balance
        self.balance += msg.amount;

        // This message should come only from master, or from other JettonWallet
        if (sender() != self.master) {
            let init: StateInit = initOf JettonWallet(0, msg.sender, self.master);
            throwUnless(707, contractAddress(init) == sender());
        }

        // Get value for gas
        let ctx: Context = context(); //Context of current message
        let msgValue: Int = ctx.value;
        let tonBalanceBeforeMsg = myBalance() - msgValue;
        let storageFee = self.minTonsForStorage - min(tonBalanceBeforeMsg, self.minTonsForStorage);
        msgValue -= (storageFee + self.gasConsumption);


        if (msg.forwardTonAmount > 0) {
            let fwdFee: Int = muldivc(fwdFee(ctx.raw), 3, 2);
            msgValue = ((msgValue - msg.forwardTonAmount) - fwdFee);
            message(MessageParameters{
                to: self.owner,
                value: msg.forwardTonAmount,
                mode: SendPayGasSeparately,
                bounce: false,
                body: JettonNotification{ // 0x7362d09c -- Remind the new Owner
                    queryId: msg.queryId,
                    amount: msg.amount,
                    sender: msg.sender,
                    forwardPayload: msg.forwardPayload,
                }.toCell(),
            });
        }

        // 0xd53276db -- Cashback to the original Sender
        if (msg.responseDestination != null && msgValue > 0) {
            message(MessageParameters{
                to: msg.responseDestination!!,
                value: msgValue,
                mode: SendIgnoreErrors,
                bounce: false,
                body: JettonExcesses{ queryId: msg.queryId }.toCell(),
            });
        }
    }
    receive(msg: Slice) {
        throw(0xffff);
    }

    receive(msg: JettonBurn) {
        throwUnless(705, sender() == self.owner);

        self.balance -= msg.amount; // Update balance
        throwUnless(706, self.balance >= 0);
        let ctx = context();
        let fwd_fee: Int = muldivc(fwdFee(ctx.raw), 3, 2); // Gas checks
        throwUnless(707, ctx.value > (fwd_fee + 2 * self.gasConsumption));
        // Burn tokens
        message(MessageParameters{
            to: self.master,
            value: 0,
            mode: SendRemainingValue,
            bounce: true,
            body: JettonBurnNotification{
                queryId: msg.queryId,
                amount: msg.amount,
                sender: self.owner,
                responseDestination: msg.responseDestination,
            }.toCell(),
        });
    }

    bounced(msg: bounced<JettonTransferInternal>) {
        self.balance += msg.amount;
    }

    bounced(msg: bounced<JettonBurnNotification>) {
        self.balance += msg.amount;
    }

    bounced(msg: Slice) {
        throw(709);
    }

    get fun get_wallet_data(): JettonWalletData {
        return JettonWalletData{
            balance: self.balance,
            owner: self.owner,
            master: self.master,
            code: myCode()
        };
    }
}

inline fun fwdFee(ctxRaw: Slice): Int {
    ctxRaw.loadAddress();
    ctxRaw.loadCoins();
    ctxRaw.skipBits(1);
    ctxRaw.loadCoins();
    return ctxRaw.loadCoins();
}