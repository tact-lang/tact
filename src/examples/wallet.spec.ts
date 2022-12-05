import { Wallet_init } from "./wallet.tact.api";
import { mnemonicNew, mnemonicToWalletKey } from 'ton-crypto';
import { createExecutorFromCode } from "ton-nodejs";

describe('wallet', () => {
    it('should deploy', async () => {

        // Create wallet
        let mnemonic = await mnemonicNew(24);
        let key = await mnemonicToWalletKey(mnemonic);
        // BigInt('0x' + key.publicKey.toString('hex'))
        let init = await Wallet_init(11n, 10n);

        // Create executor
        let executor = await createExecutorFromCode(init);
        expect((await executor.get('publicKey')).stack.readBigNumber().toString(10)).toBe('0');
    });
});