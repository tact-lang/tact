import { createExecutorFromCode } from "ton-nodejs";
import { StdlibTest_init } from "./contracts/stdlib.tact.api";

describe('stdlib', () => {
    it('should execute slice methods correctly', async () => {
        let init = await StdlibTest_init();
        let executor = await createExecutorFromCode(init);
    });
});