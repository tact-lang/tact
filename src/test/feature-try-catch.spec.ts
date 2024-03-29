import { toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { TryCatchTester } from './features/output/try-catch_TryCatchTester';

describe('feature-ternary', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should implement try-catch statements correctly', async () => {
    
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await TryCatchTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, {
            $$type: 'Deploy',
            queryId: 0n
        });
        await system.run();

        // Check methods
        expect(await contract.getTestTryCatch1()).toEqual(7n);
        expect(await contract.getTestTryCatch2()).toEqual(101n);
        expect(await contract.getTestTryCatch3()).toEqual(4n);
    });
});