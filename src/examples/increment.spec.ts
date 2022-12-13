import { IncrementContract_init, packIncrement } from "./output/increment_IncrementContract";
import { createExecutorFromCode, ExecuteError } from "ton-nodejs";
import { CellMessage, CommonMessageInfo, InternalMessage, parseDict, toNano } from "ton";
import BN from "bn.js";

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
                    body: new CellMessage(packIncrement({
                        $$type: 'Increment',
                        key: new BN(0),
                        value: new BN(-1232)
                    }))
                })
            }), { debug: true });
            console.warn(res.gasConsumed);
        } catch (e) {
            if (e instanceof ExecuteError) {
                console.warn(e.debugLogs);
            }
            throw e;
        }

        let res = await executor.get('counters');
        let dict = parseDict(res.stack.readCell().beginParse(), 257, (sc) => sc.readInt(257).toString(10));
        console.warn(dict);

        let res2 = await executor.get('counters2');
        let dict2 = parseDict(res2.stack.readCell().beginParse(), 267, (sc) => sc.readInt(257).toString(10));
        console.warn(dict2);
        // new BN(Array.from(dict.keys())[0]).toString('hex');
    });
});