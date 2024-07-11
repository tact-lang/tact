import { __DANGER_resetNodeId } from "../../grammar/ast";
import { A } from "./contracts/output/abi_A";
import { B } from "./contracts/output/abi_B";
import { C } from "./contracts/output/abi_C";
import { D } from "./contracts/output/abi_D";

describe("abi", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should generate ABI correctly", async () => {
        const a = await A.fromInit();
        expect(a).toMatchSnapshot();

        const b = await B.fromInit();
        expect(b).toMatchSnapshot();

        const c = await C.fromInit();
        expect(c).toMatchSnapshot();

        const d = await D.fromInit();
        expect(d).toMatchSnapshot();
    });
});
