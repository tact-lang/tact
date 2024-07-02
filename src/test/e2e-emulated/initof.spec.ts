import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { Self } from "./contracts/output/initof_Self";
import { Parent } from "./contracts/output/initof_Parent";
import { consoleLogger } from "../../logger";

describe("initOf", () => {
    beforeAll(() => {
        jest.spyOn(consoleLogger, "error").mockImplementation(() => {});
    });

    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    afterAll(() => {
        (consoleLogger.error as jest.Mock).mockRestore();
    });

    afterEach(() => {
        (consoleLogger.error as jest.Mock).mockClear();
    });
    it("should implement initOf correctly - 1", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await Self.fromInit());
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        const addr1 = (await contract.getTestInitOfAddress()).toRawString();
        const addr2 = (await contract.getTestMyAddress()).toRawString();
        expect(addr1).toEqual(addr2);
    });
    it("should implement initOf correctly - 2", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await Parent.fromInit());
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();
        const addrChildInitOf = (
            await contract.getTestInitOfAddressChild()
        ).toRawString();
        const addrChildMyAddress = (
            await contract.getTestMyAddressChild()
        ).toRawString();
        expect(addrChildInitOf).toEqual(addrChildMyAddress);
    });
});
