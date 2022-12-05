import { Wallet_init } from "./wallet.tact.api";
import { mnemonicNew, mnemonicToWalletKey } from 'ton-crypto';
import { createExecutorFromCode } from "ton-nodejs";

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
    });
});