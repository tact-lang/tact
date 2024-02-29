import { toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { IntegerLiteralsTester } from './features/output/integer-literals_IntegerLiteralsTester';

describe('feature-integer-literals', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should implement integer literals correctly', async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await IntegerLiteralsTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, null);
        await system.run();

        // Check methods
        expect(await contract.getDecLiteral1()).toEqual(123n);
        expect(await contract.getDecLiteral2()).toEqual(-123n);
        expect(await contract.getDecLiteral3()).toEqual(1012300000n);

        expect(await contract.getHexLiteral1()).toEqual(0x123n);
        expect(await contract.getHexLiteral2()).toEqual(-0x123n);
        expect(await contract.getHexLiteral3()).toEqual(0x1012300000n);

        expect(await contract.getBinLiteral1()).toEqual(0b101010n);
        expect(await contract.getBinLiteral2()).toEqual(-0b101010n);
        expect(await contract.getBinLiteral3()).toEqual(0b1010100000n);

        expect(await contract.getOctLiteral1()).toEqual(0o123n);
        expect(await contract.getOctLiteral2()).toEqual(-0o123n);
        expect(await contract.getOctLiteral3()).toEqual(0o1012300000n);
    });
});
