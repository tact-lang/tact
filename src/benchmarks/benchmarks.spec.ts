import { toNano } from "ton-core";
import { ContractSystem } from "ton-emulator";
import { inspect } from "util";
import { Functions } from './contracts/output/benchmark_functions_Functions';
import { Functions as FunctionsInline } from './contracts/output/benchmark_functions_inline_Functions';

describe('benchmarks', () => {
    it('benchmark functions', async () => {

        // Launch emulator
        let system = await ContractSystem.create();
        let treasure = system.treasure('benchmarks');
        let functions = system.open(await Functions.fromInit());
        let tracker = system.track(functions.address);
        await functions.send(treasure, { value: toNano(1) }, { $$type: 'Add', value: 10n });
        await system.run();

        // Find gas used
        let gasUsed = tracker.collect().reduce((a, v) => a + v.events.reduce((c, d) => d.$type === 'processed' ? c + d.gasUsed : c, 0n), 0n);
        expect(gasUsed).toMatchInlineSnapshot(`2797n`);
        expect(functions.init!.code.toBoc().length).toMatchInlineSnapshot(`268`);
    });
    it('benchmark functions(inline)', async () => {

        // Launch emulator
        let system = await ContractSystem.create();
        let treasure = system.treasure('benchmarks');
        let functions = system.open(await FunctionsInline.fromInit());
        let tracker = system.track(functions.address);
        await functions.send(treasure, { value: toNano(1) }, { $$type: 'Add', value: 10n });
        await system.run();

        // Find gas used
        let gasUsed = tracker.collect().reduce((a, v) => a + v.events.reduce((c, d) => d.$type === 'processed' ? c + d.gasUsed : c, 0n), 0n);
        expect(gasUsed).toMatchInlineSnapshot(`2666n`);
        expect(functions.init!.code.toBoc().length).toMatchInlineSnapshot(`261`);
    });
});