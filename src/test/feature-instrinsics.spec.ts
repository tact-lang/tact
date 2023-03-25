import { Address, beginCell, Cell, toNano } from 'ton-core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { IntrinsicsTester } from './features/output/intrinsics_IntrinsicsTester';

describe('feature-instrinsics', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should return correct instinsic results', async () => {
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await IntrinsicsTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, 'Deploy');
        await system.run();
        expect(await contract.getGetTons()).toBe(toNano('10.1234'));
        expect(await contract.getGetTons2()).toBe(toNano('10.1234'));
        expect(await contract.getGetString()).toBe('Hello world');
        expect(await contract.getGetString2()).toBe('Hello world');
        expect((await contract.getGetAddress()).equals(Address.parse('EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N'))).toBe(true);
        expect((await contract.getGetAddress2()).equals(Address.parse('EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N'))).toBe(true);
        expect((await contract.getGetCell()).equals(Cell.fromBase64('te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw='))).toBe(true);
        expect((await contract.getGetCell2()).equals(Cell.fromBase64('te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw='))).toBe(true);
        expect(await contract.getGetPow()).toBe(512n);
        expect(await contract.getGetPow2()).toBe(512n);
        expect((await contract.getGetComment()).equals(beginCell().storeUint(0, 32).storeStringTail('Hello world').endCell())).toBe(true);
    });
});