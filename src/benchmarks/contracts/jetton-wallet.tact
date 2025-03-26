import "./messages";

contract JettonWallet(
    balance: Int as coins,
    owner: Address,
    master: Address,
) {
    const minTonsForStorage: Int = ton("0.01");
    const gasConsumption: Int = ton("0.015");

    receive(msg: JettonTransfer) {
        forceBasechain(msg.destination);
        throwUnless(705, sender() == self.owner);

        self.balance -= msg.amount;
        throwUnless(706, self.balance >= 0);
        throwUnless(708, msg.forwardPayload.bits() >= 1);

        let ctx = context();

        // srcWallet -> destWallet
        // destWallet -> owner (this one is optional and won't be send if msg.forwardTonAmount == 0)
        let fwdCount = 1 + sign(msg.forwardTonAmount); // msg.forwardTonAmount is coins, so it's not negative

        throwUnless(709, ctx.value >
            msg.forwardTonAmount +
            fwdCount * ctx.readForwardFee() +
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
        self.balance += msg.amount;

        // This message should come only from master, or from other JettonWallet
        let wallet: StateInit = initOf JettonWallet(0, msg.sender, self.master);
        if (!wallet.hasSameBasechainAddress(sender())) {
            throwUnless(707, self.master == sender());
        }

        let ctx: Context = context();
        let msgValue: Int = ctx.value;
        let tonBalanceBeforeMsg = myBalance() - msgValue;
        let storageFee = self.minTonsForStorage - min(tonBalanceBeforeMsg, self.minTonsForStorage);
        msgValue -= (storageFee + self.gasConsumption);

        if (msg.forwardTonAmount > 0) {
            let fwdFee: Int = ctx.readForwardFee();
            msgValue -= msg.forwardTonAmount + fwdFee;
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

    receive(msg: JettonBurn) {
        throwUnless(705, sender() == self.owner);

        self.balance -= msg.amount;
        throwUnless(706, self.balance >= 0);

        let ctx = context();
        let fwdFee: Int = ctx.readForwardFee();
        throwUnless(707, ctx.value > (fwdFee + 2 * self.gasConsumption));

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

    receive(_: Slice) { throw(0xffff) }

    bounced(msg: bounced<JettonTransferInternal>) {
        self.balance += msg.amount;
    }

    bounced(msg: bounced<JettonBurnNotification>) {
        self.balance += msg.amount;
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
