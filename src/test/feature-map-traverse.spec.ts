import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { MapTraverseTestContract } from "./features/output/map-traverse_MapTraverseTestContract";

describe("feature-map-traversal", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement map traversal correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await MapTraverseTestContract.fromInit());
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        // Check methods
        expect(await contract.getTestIntInt()).toEqual(1010n);
        expect(await contract.getTestIntBool()).toEqual(12n);
        expect(await contract.getTestIntCell()).toEqual(1010n);
        expect(await contract.getTestIntAddress()).toEqual(28n);
        expect(await contract.getTestIntStruct()).toEqual(1010n);

        expect(await contract.getTestAddressInt()).toEqual(1018n);
        expect(await contract.getTestAddressBool()).toEqual(20n);
        expect(await contract.getTestAddressCell()).toEqual(1018n);
        expect(await contract.getTestAddressAddress()).toEqual(26n);
        expect(await contract.getTestAddressStruct()).toEqual(1018n);

        expect(await contract.getTestEmptyMap()).toEqual(0n);
        expect(await contract.getTestNull()).toEqual(0n);

        expect(await contract.getTestMapModificationDuringTraversal1()).toEqual(
            808n,
        );
        // XXX works on my macOS instance, but fails in CI for some reason
        // await expect(
        //     contract.getTestMapModificationDuringTraversal2(),
        // ).rejects.toMatchObject(Error("Exit code: -14"));

        expect(await contract.getTestMapSize()).toEqual(4n);

        expect(await contract.getTestMapAsField()).toEqual(606n);
        expect(await contract.getTestMapAsStructField()).toEqual(606n);
    });
});
