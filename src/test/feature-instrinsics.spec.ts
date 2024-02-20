import { Address, beginCell, Cell, toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { IntrinsicsTester } from './features/output/intrinsics_IntrinsicsTester';
import { sha256_sync } from '@ton/crypto';

describe('feature-instrinsics', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should return correct instinsic results', async () => {
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await IntrinsicsTester.fromInit());
        system.name(contract, 'contract');
        await contract.send(treasure, { value: toNano('10') }, 'Deploy');
        await system.run();

        // Compile-time constants
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

        // Compile-time optimizations
        expect((await contract.getGetComment()).equals(beginCell().storeUint(0, 32).storeStringTail('Hello world').endCell())).toBe(true);

        // Compile-time send/emit optimizations
        const tracker = system.track(contract);
        await contract.send(treasure, { value: toNano(1) }, 'emit_1');
        await system.run();

        // Check that the contract emitted the correct message
        const tracked = tracker.collect();
        expect(tracked).toMatchSnapshot();

        // Check sha256
        function sha256(src: string | Buffer) {
            return BigInt('0x' + sha256_sync(src).toString('hex'));
        }
        expect(await contract.getGetHash()).toBe(sha256('hello world'));
        expect(await contract.getGetHash2()).toBe(sha256('hello world'));
        expect(await contract.getGetHash3(beginCell().storeStringTail('sometest').endCell())).toBe(sha256('sometest'));
        expect(await contract.getGetHash4('wallet')).toBe(sha256('wallet'));
    });
});