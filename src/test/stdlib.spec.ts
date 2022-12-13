import { beginCell } from "ton";
import { createExecutorFromCode } from "ton-nodejs";
import { StdlibTest, StdlibTest_init } from "./contracts/stdlib.StdlibTest.bind";

describe('stdlib', () => {
    it('should execute slice methods correctly', async () => {
        let init = await StdlibTest_init();
        let executor = await createExecutorFromCode(init);
        let stdlibtest = new StdlibTest(executor);
        let slice = beginCell()
            .storeBit(1)
            .storeBit(1)
            .storeRef(beginCell().storeBit(1).endCell())
            .endCell();
        let bits = (await stdlibtest.getSliceBits(slice)).toNumber();
        let refs = (await stdlibtest.getSliceRefs(slice)).toNumber();
        let empty = (await stdlibtest.getSliceEmpty(slice));
        expect(bits).toBe(2);
        expect(refs).toBe(1);
        expect(empty).toBe(false);
    });
});