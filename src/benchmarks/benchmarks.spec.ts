import { toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { Functions } from "./contracts/output/benchmark_functions_Functions";
import { Functions as FunctionsInline } from "./contracts/output/benchmark_functions_inline_Functions";

describe("benchmarks", () => {
    it("benchmark functions", async () => {
        // Launch emulator
        const system = await ContractSystem.create();
        const treasure = system.treasure("benchmarks");
        const functions = system.open(await Functions.fromInit());
        const tracker = system.track(functions.address);
        await functions.send(
            treasure,
            { value: toNano(1) },
            { $$type: "Add", value: 10n },
        );
        await system.run();

        // Find gas used
        const gasUsed = tracker
            .collect()
            .reduce(
                (a, v) =>
                    a +
                    v.events.reduce(
                        (c, d) => (d.$type === "processed" ? c + d.gasUsed : c),
                        0n,
                    ),
                0n,
            );
        expect(gasUsed).toMatchInlineSnapshot(`3648n`);
        expect(functions.init!.code.toBoc().length).toMatchInlineSnapshot(
            `429`,
        );
    });
    it("benchmark functions(inline)", async () => {
        // Launch emulator
        const system = await ContractSystem.create();
        const treasure = system.treasure("benchmarks");
        const functions = system.open(await FunctionsInline.fromInit());
        const tracker = system.track(functions.address);
        await functions.send(
            treasure,
            { value: toNano(1) },
            { $$type: "Add", value: 10n },
        );
        await system.run();

        // Find gas used
        const gasUsed = tracker
            .collect()
            .reduce(
                (a, v) =>
                    a +
                    v.events.reduce(
                        (c, d) => (d.$type === "processed" ? c + d.gasUsed : c),
                        0n,
                    ),
                0n,
            );
        expect(gasUsed).toMatchInlineSnapshot(`3517n`);
        expect(functions.init!.code.toBoc().length).toMatchInlineSnapshot(
            `422`,
        );
    });
});
