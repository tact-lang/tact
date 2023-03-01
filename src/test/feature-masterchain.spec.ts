import { toNano } from 'ton-core';
import { ContractSystem } from 'ton-emulator';
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
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await MasterchainTester.fromInit());
        let tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
    });
    it('should deploy to the workchain when masterchain enabled', async () => {
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await EnabledTester.fromInit());
        let tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
    });
    it('should not deploy to the workchain from masterchain', async () => {
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure', -1);
        let contract = system.open(await MasterchainTester.fromInit());
        let tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
    });
    it('should deploy to the workchain from masterchain when masterchain enabled', async () => {
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure', -1);
        let contract = system.open(await EnabledTester.fromInit());
        let tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
    });

    //
    // newAddress
    //

    it('should create address for the workchain', async () => {
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await MasterchainTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        await contract.getCreateAddress(0n, 0n);
    });

    it('should not create address for the materchain', async () => {
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await MasterchainTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        await expect(contract.getCreateAddress(-1n, 0n)).rejects.toThrowError('Masterchain support is not enabled for this contract');
    });

    it('should create address for the masterchain when masterchain enabled', async () => {
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await EnabledTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        await contract.getCreateAddress(-1n, 0n);
    });

    it('should not create address for invalid workchain', async () => {
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await MasterchainTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, "Deploy");
        await system.run();
        await expect(contract.getCreateAddress(10n, 0n)).rejects.toThrowError('Invalid address');
    });
});