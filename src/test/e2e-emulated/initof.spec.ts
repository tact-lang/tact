import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { Self } from "./contracts/output/initof_Self";
import { Parent } from "./contracts/output/initof_Parent";
import { TestInit } from "./contracts/output/initof-2_TestInit";
import { A } from "./contracts/output/initof-3_A";

describe("initOf", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
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
    it("should implement initof correctly - 3", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await TestInit.fromInit());
        const logger = system.log(contract.address);
        await contract.send(
            treasure,
            { value: toNano("10") },
            {
                $$type: "Deploy",
                queryId: 0n,
            },
        );
        await system.run();

        const res = logger.collect();

        expect(res.includes("init@TestInit-SUCCESS")).toBe(true);
        expect(res.includes("ERROR@TestInit")).toBe(false);
    });
    it("should implement initof correctly - 4", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await A.fromInit());
        const tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano("10") }, "aa");
        await system.run();

        expect(tracker.collect()).toMatchSnapshot();
    });
});
