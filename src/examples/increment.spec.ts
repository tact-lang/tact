import { IncrementContract_init, packIncrement } from "./increment.IncrementContract.bind";
import { createExecutorFromCode, ExecuteError } from "ton-nodejs";
import { CellMessage, CommonMessageInfo, InternalMessage, parseDict, toNano } from "ton";

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
                        key: 0n,
                        value: -1232n
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
        let dict = parseDict(res.stack.readCell().beginParse(), 257, (sc) => sc.readRef().readInt(257).toString(10));
        console.warn(dict);
    });


});