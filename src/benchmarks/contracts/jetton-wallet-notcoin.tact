import "./messages";

// gas
const SEND_TRANSFER_GAS_CONSUMPTION: Int = 10065;
const RECEIVE_TRANSFER_GAS_CONSUMPTION: Int = 10435;
const SEND_BURN_GAS_CONSUMPTION: Int = 5891;
const RECEIVE_BURN_GAS_CONSUMPTION: Int = 6757;

// storage
const MIN_STORAGE_DURATION: Int = 5 * 365 * 24 * 3600; // 5 years

const JETTON_WALLET_BITS: Int = 1033;
const JETTON_WALLET_CELLS: Int = 3;

const JETTON_WALLET_INIT_STATE_BITS: Int  = 931;
const JETTON_WALLET_INIT_STATE_CELLS: Int = 3;

const BURN_NOTIFICATION_BITS: Int = 754;
const BURN_NOTIFICATION_CELLS: Int = 1;

inline fun checkAmountIsEnoughToTransfer(msgValue: Int, forwardTonAmount: Int, fwdFee: Int) {
    let fwdCount = 1 + sign(forwardTonAmount);

    throwUnless(
        705,
        msgValue > fwdCount * fwdFee +
        getSimpleForwardFee(JETTON_WALLET_INIT_STATE_CELLS, JETTON_WALLET_INIT_STATE_BITS, false) +
        getComputeFee(SEND_TRANSFER_GAS_CONSUMPTION, false) +
        getComputeFee(RECEIVE_TRANSFER_GAS_CONSUMPTION, false) +
        getStorageFee(JETTON_WALLET_CELLS, JETTON_WALLET_BITS, MIN_STORAGE_DURATION, false)
    );
}

inline fun checkAmountIsEnoughToBurn(msgValue: Int) {
    throwUnless(
        705,
        msgValue >
        getForwardFee(BURN_NOTIFICATION_CELLS, BURN_NOTIFICATION_BITS, false) +
        getComputeFee(SEND_BURN_GAS_CONSUMPTION, false) +
        getComputeFee(RECEIVE_BURN_GAS_CONSUMPTION, false)
    );
}

contract JettonWalletNotcoin(
    balance: Int as coins,
    owner: Address,
    master: Address,
) {
    receive(msg: JettonTransfer) {
        forceBasechain(msg.destination);
        throwUnless(705, sender() == self.owner);

        self.balance -= msg.amount;
        throwUnless(706, self.balance >= 0);
        throwUnless(708, msg.forwardPayload.bits() >= 1);

        let ctx = context();
        checkAmountIsEnoughToTransfer(ctx.value, msg.forwardTonAmount, ctx.readForwardFee());

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
            init: initOf JettonWalletNotcoin(0, msg.destination, self.master),
        });
    }

    receive(msg: JettonTransferInternal) {
        self.balance += msg.amount;

        // This message should come only from master, or from other JettonWallet
        let wallet: StateInit = initOf JettonWalletNotcoin(0, msg.sender, self.master);
        if (!wallet.hasSameBasechainAddress(sender())) {
            throwUnless(707, self.master == sender());
        }

        if (msg.forwardTonAmount > 0) {
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
        if (msg.responseDestination != null) {
            let leaveOnBalance: Int = myBalance() - context().value + myStorageDue();
            nativeReserve(
                max(leaveOnBalance, getStorageFee(JETTON_WALLET_CELLS, JETTON_WALLET_BITS, MIN_STORAGE_DURATION, false)),
                2
            );

            message(MessageParameters{
                to: msg.responseDestination!!,
                value: 0,
                mode: SendRemainingBalance | SendIgnoreErrors,
                bounce: false,
                body: JettonExcesses{ queryId: msg.queryId }.toCell(),
            });
        }
    }

    receive(msg: JettonBurn) {
        throwUnless(705, sender() == self.owner);

        self.balance -= msg.amount;
        throwUnless(706, self.balance >= 0);

        checkAmountIsEnoughToBurn(context().value);

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
