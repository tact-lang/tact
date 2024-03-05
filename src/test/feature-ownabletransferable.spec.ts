import { Address, toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { OwnableTransferableTest } from './features/output/ownabletransferable_OwnableTransferableTest';

describe('feature-ordering', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should deploy correctly', async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(
            await OwnableTransferableTest.fromInit(treasure.address)
        );
        const tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('1') }, 'test');
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
        expect(
            (await contract.getOwner()).equals(treasure.address)
        ).toBeTruthy();
    });

    it('should transfer ownership correctly', async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(
            await OwnableTransferableTest.fromInit(treasure.address)
        );
        const tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('1') }, 'test');
        await system.run();
        const anotherTreasure = system.treasure('anotherTreasure');
        await contract.send(
            treasure,
            { value: toNano('1') },
            {
                $$type: 'ChangeOwner',
                newOwner: anotherTreasure.address,
                queryId: 0n,
            }
        );
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
        expect(
            (await contract.getOwner()).equals(anotherTreasure.address)
        ).toBeTruthy();
    });

    it('should renounce ownership correctly', async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(
            await OwnableTransferableTest.fromInit(treasure.address)
        );
        const tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('1') }, 'test');
        await system.run();

        const anotherTreasure = system.treasure('anotherTreasure');
        await contract.send(
            treasure,
            { value: toNano('1') },
            {
                $$type: 'ChangeOwner',
                newOwner: anotherTreasure.address,
                queryId: 0n,
            }
        );
        await system.run();
        expect(
            (await contract.getOwner()).equals(anotherTreasure.address)
        ).toBeTruthy();

        await contract.send(
            anotherTreasure,
            { value: toNano('1') },
            {
                $$type: 'RenounceOwnership',
                queryId: 0n,
            }
        );
        await system.run();
        expect(
            (await contract.getOwner()).equals(
                Address.parseRaw(
                    '0:0000000000000000000000000000000000000000000000000000000000000000'
                )
            )
        ).toBeTruthy();
        expect(tracker.collect()).toMatchSnapshot();
    });
});
