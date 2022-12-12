import { packTransfer, packTransferMessage, Transfer, Wallet, Wallet_init } from "./wallet.Wallet.bind";
import { mnemonicNew, mnemonicToWalletKey, sign } from 'ton-crypto';
import { createExecutorFromCode, ExecuteError } from "ton-nodejs";
import { Address, beginCell, Cell, CellMessage, CommonMessageInfo, InternalMessage, toNano } from "ton";
import { BN } from "bn.js";

describe('wallet', () => {
    it('should deploy', async () => {

        // Create wallet
        let mnemonic = await mnemonicNew(24);
        let key = await mnemonicToWalletKey(mnemonic);
        let pk = BigInt('0x' + key.publicKey.toString('hex'))
        let init = await Wallet_init(pk, 0n);

        // Create executor
        let executor = await createExecutorFromCode(init);
        expect((await executor.get('publicKey')).stack.readBigNumber().toString('hex')).toBe(pk.toString(16));
        expect((await executor.get('walletId')).stack.readNumber()).toBe(0);
        expect((await executor.get('seqno')).stack.readNumber()).toBe(0);

        // Try send

        let transfer: Transfer = {
            $$type: 'Transfer',
            seqno: 0n,
            mode: 1n,
            amount: BigInt(toNano(10).toString(10)),
            to: executor.address,
            body: null
        };
        // let transfer = new Cell();
        // new InternalMessage({ to: executor.address, value: toNano(10), bounce: false, body: new CommonMessageInfo() }).writeTo(transfer);
        let signed = sign(packTransfer(transfer).hash(), key.secretKey);

        try {
            let res = await executor.internal(new InternalMessage({
                to: executor.address,
                from: executor.address,
                bounce: false,
                value: toNano(10),
                body: new CommonMessageInfo({
                    body: new CellMessage(packTransferMessage({
                        $$type: 'TransferMessage',
                        transfer,
                        signature: beginCell().storeBuffer(signed).endCell().beginParse()
                    }))
                })
            }));
            console.warn(res);
        } catch (e) {
            if (e instanceof ExecuteError) {
                console.warn(e.debugLogs);
            }
            throw e;
        }

        // Check seqno
        let wallet = new Wallet(executor);
        expect((await wallet.getSeqno()).toString(10)).toBe('1');

        // Send empty message
        await wallet.send({ amount: new BN(0) }, null);
        expect((await wallet.getSeqno()).toString(10)).toBe('2');

        // Send comment message
        await wallet.send({ amount: new BN(0) }, 'notify');
        expect((await wallet.getSeqno()).toString(10)).toBe('3');
    });
});