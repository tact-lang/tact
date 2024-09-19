import { Address, beginCell, toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { MasterchainTester } from "./contracts/output/masterchain_MasterchainTester";
import { MasterchainTester as EnabledTester } from "./contracts/output/masterchain-allow_MasterchainTester";
import "@ton/test-utils";

describe("masterchain", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
    });

    //
    // Deployment and simple message receiving
    //

    it("should deploy to the workchain", async () => {
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should deploy to the workchain when masterchain enabled", async () => {
        const contract = blockchain.openContract(
            await EnabledTester.fromInit(),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should not deploy to the workchain from masterchain", async () => {
        const treasure = await blockchain.treasury("treasure", {
            workchain: -1,
        });
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: false,
            deploy: true,
            exitCode: 137,
        });
    });

    it("should deploy to the workchain from masterchain when masterchain enabled", async () => {
        const treasure = await blockchain.treasury("treasure", {
            workchain: -1,
        });
        const contract = blockchain.openContract(
            await EnabledTester.fromInit(),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    //
    // newAddress
    //

    it("should create address for the workchain", async () => {
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const address = await contract.getCreateAddress(0n, 0n);
        expect(address).toBeDefined();
    });

    it("should not create address for the masterchain", async () => {
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        await expect(contract.getCreateAddress(-1n, 0n)).rejects.toThrow(
            "Unable to execute get method. Got exit_code: 137",
        );
    });

    it("should create address for the masterchain when masterchain enabled", async () => {
        const contract = blockchain.openContract(
            await EnabledTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const address = await contract.getCreateAddress(-1n, 0n);
        expect(address).toBeDefined();
    });

    it("should not create address for invalid workchain", async () => {
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        await expect(contract.getCreateAddress(10n, 0n)).rejects.toThrow(
            "Unable to execute get method. Got exit_code: 136",
        );
    });

    //
    // loadAddress
    //

    it("should load address for the workchain", async () => {
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const addr = new Address(0, Buffer.alloc(32, 0));
        expect(
            (
                await contract.getParseAddress(
                    beginCell().storeAddress(addr).endCell().asSlice(),
                )
            ).equals(addr),
        ).toBe(true);
    });

    it("should not load address for the masterchain", async () => {
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const addr = new Address(-1, Buffer.alloc(32, 0));
        await expect(
            contract.getParseAddress(
                beginCell().storeAddress(addr).endCell().asSlice(),
            ),
        ).rejects.toThrowError(
            "Unable to execute get method. Got exit_code: 137",
        );
    });

    it("should load address for the workchain when masterchain enabled", async () => {
        const contract = blockchain.openContract(
            await EnabledTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const addr = new Address(0, Buffer.alloc(32, 0));
        expect(
            (
                await contract.getParseAddress(
                    beginCell().storeAddress(addr).endCell().asSlice(),
                )
            ).equals(addr),
        ).toBe(true);
    });

    it("should load address for the masterchain when masterchain enabled", async () => {
        const contract = blockchain.openContract(
            await EnabledTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const addr = new Address(-1, Buffer.alloc(32, 0));
        expect(
            (
                await contract.getParseAddress(
                    beginCell().storeAddress(addr).endCell().asSlice(),
                )
            ).equals(addr),
        ).toBe(true);
    });

    //
    // argument of get method
    //

    it("should handle address in get argument for the workchain", async () => {
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const addr = new Address(0, Buffer.alloc(32, 0));
        await contract.getSerializeAddress(addr);
    });

    it("should not handle address in get argument for the masterchain", async () => {
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const addr = new Address(-1, Buffer.alloc(32, 0));
        await expect(contract.getSerializeAddress(addr)).rejects.toThrowError(
            "Unable to execute get method. Got exit_code: 137",
        );
    });

    it("should handle address in get argument for the workchain when masterchain enabled", async () => {
        const contract = blockchain.openContract(
            await EnabledTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const addr = new Address(0, Buffer.alloc(32, 0));
        await contract.getSerializeAddress(addr);
    });

    it("should handle address in get argument for the masterchain when masterchain enabled", async () => {
        const contract = blockchain.openContract(
            await EnabledTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const addr = new Address(-1, Buffer.alloc(32, 0));
        await contract.getSerializeAddress(addr);
    });

    //
    // argument of get method in struct
    //

    it("should handle address in get argument struct for the workchain", async () => {
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const addr = new Address(0, Buffer.alloc(32, 0));
        await contract.getHandleStruct({
            $$type: "TestMessage",
            address: addr,
            address2: null,
        });
        await contract.getHandleStruct({
            $$type: "TestMessage",
            address: addr,
            address2: addr,
        });
    });

    it("should not handle address in get argument struct for the masterchain", async () => {
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const addr = new Address(-1, Buffer.alloc(32, 0));
        const addr2 = new Address(0, Buffer.alloc(32, 0));
        await expect(
            contract.getHandleStruct({
                $$type: "TestMessage",
                address: addr,
                address2: null,
            }),
        ).rejects.toThrowError(
            "Unable to execute get method. Got exit_code: 137",
        );
        await expect(
            contract.getHandleStruct({
                $$type: "TestMessage",
                address: addr2,
                address2: addr,
            }),
        ).rejects.toThrowError(
            "Unable to execute get method. Got exit_code: 137",
        );
    });

    it("should handle address in get argument struct for the workchain when masterchain enabled", async () => {
        const contract = blockchain.openContract(
            await EnabledTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const addr = new Address(0, Buffer.alloc(32, 0));
        await contract.getHandleStruct({
            $$type: "TestMessage",
            address: addr,
            address2: addr,
        });
    });

    it("should handle address in get argument struct for the masterchain when masterchain enabled", async () => {
        const contract = blockchain.openContract(
            await EnabledTester.fromInit(),
        );

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        const addr = new Address(-1, Buffer.alloc(32, 0));
        await contract.getHandleStruct({
            $$type: "TestMessage",
            address: addr,
            address2: addr,
        });
    });
});
