import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { Test } from "./contracts/output/allocation_Test";

describe("allocation", () => {
    it("should deploy correctly and process SetCost message without cell overflow", async () => {
        const system = await ContractSystem.create();
        const owner = system.treasure("owner");
        const contract = system.open(
            await Test.fromInit(owner.address, {
                $$type: "Struct2",
                c: "",
                d: "",
                e: "",
                f: "",
            }),
        );
        system.name(contract.address, "main");
        await contract.send(
            owner,
            { value: toNano(1) },
            { $$type: "Deploy", queryId: 0n },
        );
        await system.run();
        await contract.send(
            owner,
            { value: toNano(1) },
            { $$type: "SetCost", cost: toNano("0.1") },
        );
        await system.run();
    });
});
