import { Address, beginCell, toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { MasterchainTester } from './features/output/masterchain_MasterchainTester';
import { MasterchainTester as EnabledTester } from './features/output/masterchain-allow_MasterchainTester';

describe('feature-masterchain', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    //
    // Deployment and simple message receiving
    //

    it('should deploy to the workchain', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await MasterchainTester.fromInit());
        const tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
    });
    it('should deploy to the workchain when masterchain enabled', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await EnabledTester.fromInit());
        const tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
    });
    it('should not deploy to the workchain from masterchain', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure', -1);
        const contract = system.open(await MasterchainTester.fromInit());
        const tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
    });
    it('should deploy to the workchain from masterchain when masterchain enabled', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure', -1);
        const contract = system.open(await EnabledTester.fromInit());
        const tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
    });

    //
    // newAddress
    //

    it('should create address for the workchain', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await MasterchainTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        await contract.getCreateAddress(0n, 0n);
    });

    it('should not create address for the masterchain', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await MasterchainTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        await expect(contract.getCreateAddress(-1n, 0n)).rejects.toThrowError('Masterchain support is not enabled for this contract');
    });

    it('should create address for the masterchain when masterchain enabled', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await EnabledTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        await contract.getCreateAddress(-1n, 0n);
    });

    it('should not create address for invalid workchain', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await MasterchainTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        await expect(contract.getCreateAddress(10n, 0n)).rejects.toThrowError('Invalid address');
    });

    //
    // loadAddress
    //

    it('should load address for the workchain', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await MasterchainTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        const addr = new Address(0, Buffer.alloc(32, 0));
        expect((await contract.getParseAddress(beginCell().storeAddress(addr).endCell())).equals(addr)).toBe(true);
    });

    it('should not load address for the masterchain', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await MasterchainTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        const addr = new Address(-1, Buffer.alloc(32, 0));
        expect(contract.getParseAddress(beginCell().storeAddress(addr).endCell())).rejects.toThrowError('Masterchain support is not enabled for this contract');
    });

    it('should load address for the workchain when masterchain enabled', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await EnabledTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        const addr = new Address(0, Buffer.alloc(32, 0));
        expect((await contract.getParseAddress(beginCell().storeAddress(addr).endCell())).equals(addr)).toBe(true);
    });

    it('should load address for the masterchain when masterchain enabled', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await EnabledTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        const addr = new Address(-1, Buffer.alloc(32, 0));
        expect((await contract.getParseAddress(beginCell().storeAddress(addr).endCell())).equals(addr)).toBe(true);
    });

    //
    // argument of get method
    //

    it('should handle address in get argument for the workchain', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await MasterchainTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        const addr = new Address(0, Buffer.alloc(32, 0));
        await contract.getSerializeAddress(addr);
    });

    it('should not handle address in get argument for the masterchain', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await MasterchainTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        const addr = new Address(-1, Buffer.alloc(32, 0));
        expect(contract.getSerializeAddress(addr)).rejects.toThrowError('Masterchain support is not enabled for this contract');
    });

    it('should handle address in get argument for the workchain when masterchain enabled', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await EnabledTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        const addr = new Address(0, Buffer.alloc(32, 0));
        await contract.getSerializeAddress(addr);
    });

    it('should handle address in get argument for the masterchain when masterchain enabled', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await EnabledTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        const addr = new Address(-1, Buffer.alloc(32, 0));
        await contract.getSerializeAddress(addr);
    });

    //
    // argument of get method in struct
    //

    it('should handle address in get argument struct for the workchain', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await MasterchainTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        const addr = new Address(0, Buffer.alloc(32, 0));
        await contract.getHandleStruct({ $$type: 'TestMessage', address: addr, address2: null });
        await contract.getHandleStruct({ $$type: 'TestMessage', address: addr, address2: addr });
    });

    it('should not handle address in get argument struct for the masterchain', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await MasterchainTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        const addr = new Address(-1, Buffer.alloc(32, 0));
        const addr2 = new Address(0, Buffer.alloc(32, 0));
        expect(contract.getHandleStruct({ $$type: 'TestMessage', address: addr, address2: null })).rejects.toThrowError('Masterchain support is not enabled for this contract');
        expect(contract.getHandleStruct({ $$type: 'TestMessage', address: addr2, address2: addr })).rejects.toThrowError('Masterchain support is not enabled for this contract');
    });

    it('should handle address in get argument struct for the workchain when masterchain enabled', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await EnabledTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        const addr = new Address(0, Buffer.alloc(32, 0));
        await contract.getHandleStruct({ $$type: 'TestMessage', address: addr, address2: addr });
    });

    it('should handle address in get argument struct for the masterchain when masterchain enabled', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await EnabledTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        const addr = new Address(-1, Buffer.alloc(32, 0));
        await contract.getHandleStruct({ $$type: 'TestMessage', address: addr, address2: addr });
    });
});