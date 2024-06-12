import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { ExternalFallbacksTester } from "./contracts/output/external-fallbacks_ExternalFallbacksTester";

describe("strings", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement external fallbacks correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await ExternalFallbacksTester.fromInit());

        // Deploy
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();
        expect(contract.abi).toMatchSnapshot();

        expect(await contract.getGetA()).toBe(100n);

        await contract.send(
            treasure,
            { value: toNano("10") },
            {
                $$type: "Add",
                x: 10n,
            },
        );
        await system.run();
        expect(await contract.getGetA()).toBe(110n);

        await contract.sendExternal({
            $$type: "Add",
            x: 10n,
        });
        await system.run();
        expect(await contract.getGetA()).toBe(120n);

        await contract.sendExternal(null);
        await system.run();
        expect(await contract.getGetA()).toBe(220n);
    });
});
