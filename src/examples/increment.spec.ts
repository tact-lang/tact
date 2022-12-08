import { IncrementContract_init, packInrement } from "./increment.tact.api";
import { mnemonicNew, mnemonicToWalletKey, sign } from 'ton-crypto';
import { createExecutorFromCode, ExecuteError } from "ton-nodejs";
import { Address, beginCell, Cell, CellMessage, CommonMessageInfo, InternalMessage, parseDict, parseDictRefs, toNano } from "ton";

describe('increment', () => {
    it('should deploy', async () => {

        // Create wallet

        let init = await IncrementContract_init();
        let executor = await createExecutorFromCode(init);


        try {
            let res = await executor.internal(new InternalMessage({
                to: executor.address,
                from: executor.address,
                bounce: false,
                value: toNano(10),
                body: new CommonMessageInfo({
                    body: new CellMessage(packInrement({
                        $$type: 'Inrement',
                        key: 1n,
                        value: -1232n
                    }))
                })
            }), { debug: true });
        } catch (e) {
            if (e instanceof ExecuteError) {
                console.warn(e.debugLogs);
            }
            throw e;
        }

        let res = await executor.get('counters');
        let dict = parseDict(res.stack.readCell().beginParse(), 257, (sc) => sc.readRef().readInt(257).toString(10));
        console.warn(dict);
    });


});