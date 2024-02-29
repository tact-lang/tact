import { toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { A } from './features/output/deep_A';
import { B } from './features/output/deep_B';
import { C } from './features/output/deep_C';

describe('feature-random', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should chain deep sequences correctly', async () => {

        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contractA = system.open(await A.fromInit());
        const contractB = system.open(await B.fromInit(contractA.address));
        const contractC = system.open(await C.fromInit(contractB.address));
        const trackA = system.track(contractA.address);
        const trackB = system.track(contractB.address);
        const trackC = system.track(contractC.address);
        expect(trackA.address.toString({ testOnly: true })).toMatchSnapshot();
        expect(trackB.address.toString({ testOnly: true })).toMatchSnapshot();
        expect(trackC.address.toString({ testOnly: true })).toMatchSnapshot();
        await contractA.send(treasure, { value: toNano('10') }, "Message");
        await system.run();
        const nextA = await contractA.getGetNext();
        expect(nextA.code.equals(contractB.init!.code!)).toBe(true);
        expect(nextA.data.equals(contractB.init!.data!)).toBe(true);
        const nextB = await contractB.getGetNext();
        expect(nextB.code.equals(contractC.init!.code!)).toBe(true);
        expect(nextB.data.equals(contractC.init!.data!)).toBe(true);

        // Check
        expect(trackA.collect()).toMatchSnapshot();
        expect(trackB.collect()).toMatchSnapshot();
        expect(trackC.collect()).toMatchSnapshot();
    });
});