import os from "os";
import { createNodeFileSystem } from "../../src/vfs/createNodeFileSystem";
import type { VirtualFileSystem } from "../../src/vfs/VirtualFileSystem";
import { mkdtemp } from "fs/promises";
import fs from "fs/promises";
import * as path from "path";
import fc from "fast-check";

import type { Scope, ScopeItemKind } from "./scope";
import { GlobalContext } from "./context";
import type { Type } from "./types";
import type { AstId, AstNode } from "../../src/ast/ast";
import { nextId } from "./id";
import { getSrcInfo } from "../../src/grammar/src-info";

export const VALID_ID = /^[a-zA-Z_]+[a-zA-Z_0-9]$/;
export const VALID_TYPE_ID = /^[A-Z]+[a-zA-Z_0-9]$/;

/**
 * Creates a temp node file system to use inside a property.
 */
export async function withNodeFS(f: (vfs: VirtualFileSystem) => Promise<void>) {
    const tempDir = await mkdtemp(
        path.join(GlobalContext.config.compileDir, "tact-check-"),
    );
    const vfs = createNodeFileSystem(tempDir, false);
    try {
        await f(vfs);
    } finally {
        if (GlobalContext.config.compileDir == os.tmpdir()) {
            await fs.rm(tempDir, { recursive: true });
        }
    }
}

/**
 * Creates a new property that executes additional logic implemented in tact-check.
 */
export function createProperty<Ts extends [unknown, ...unknown[]]>(
    ...args: [
        ...arbitraries: { [K in keyof Ts]: fc.Arbitrary<Ts[K]> },
        predicate: (...args: Ts) => boolean | void,
    ]
): fc.IPropertyWithHooks<Ts> {
    const arbitraries = args.slice(0, -1) as unknown as {
        [K in keyof Ts]: fc.Arbitrary<Ts[K]>;
    };
    const originalPredicate = args[args.length - 1] as (
        ...args: Ts
    ) => boolean | void;
    const enhancedPredicate = (...args: Ts): boolean | void => {
        args.forEach((arg) => {
            GlobalContext.printSample(arg as AstNode);
        });
        return originalPredicate(...args);
    };
    return fc.property(...arbitraries, enhancedPredicate);
}

/**
 * Create parameters for custom property checking.
 */
function makeParams<T>(numRuns: number | undefined): fc.Parameters<T> {
    return {
        numRuns: numRuns ?? GlobalContext.config.numRuns,
        seed: GlobalContext.config.seed,
        reporter(out) {
            if (out.failed) {
                if (out.counterexample !== null && out.error !== null) {
                    // eslint-disable-next-line @typescript-eslint/no-explicit-any
                    let generated: any = out.counterexample;
                    if (!generated.kind && generated[0]?.kind) {
                        generated = generated[0];
                    }
                    out.error += `\n-----\nGenerated program:\n${GlobalContext.format(generated)}\n-----\n`;
                }
                throw new Error(fc.defaultReportMessage(out));
            }
        },
    };
}

/**
 * Checks the given property enhancing `fc.assert` with additional functionality.
 */
export function checkProperty<T>(
    property: fc.IPropertyWithHooks<T>,
    numRuns: number | undefined = undefined,
) {
    fc.assert(property, makeParams(numRuns));
}

/**
 * Checks the given async property enhancing `fc.assert` with additional functionality.
 */
export async function checkAsyncProperty<T>(
    property: fc.IAsyncPropertyWithHooks<T>,
    numRuns: number | undefined = undefined,
) {
    await fc.assert(property, makeParams(numRuns));
}

/**
 * Creates a single fast-check sample with respect to the current global configuration.
 * @param gen The arbitrary generator used to create the sample.
 * @throws If the arbitrary cannot generate any elements.
 */
export function createSample<T>(gen: fc.Arbitrary<T>): T {
    return fc.sample(gen, {
        seed: GlobalContext.config.seed,
        numRuns: 1,
    })[0];
}

/**
 * Generates an array of items using the provided generator function, with a length determined by a sampled range.
 * @param fn The generator function to create items.
 * @param minLength The minimum length of the array.
 * @param maxLength The maximum length of the array.
 * @returns An array of generated items.
 */
export function createSamplesArray<T>(
    fn: () => T,
    minLength: number,
    maxLength: number,
): T[] {
    const length = createSample(fc.integer({ min: minLength, max: maxLength }));
    return Array.from({ length }, () => fn());
}

/**
 * Generates a new valid identifier with a name unique within the current scope and with unique id.
 * @param shadowing Allow shadowing (using names available in parent scopes)
 */
export function generateName(
    scope: Scope,
    kind: ScopeItemKind,
    shadowing: boolean = true,
    isType: boolean = false,
): fc.Arbitrary<string> {
    const availableNames = shadowing
        ? scope.getEntries(kind)
        : scope.getEntriesRecursive(kind);

    return fc
        .stringMatching(isType ? VALID_TYPE_ID : VALID_ID)
        .filter((generatedName) => {
            if (availableNames.find(([name, _]) => name == generatedName)) {
                return false;
            }
            return true;
        });
}

/**
 * Generates AstId from string name and with new id.
 */
export function generateAstIdFromName(name: string): AstId {
    return {
        kind: "id",
        text: name,
        id: nextId(),
        loc: dummySrcInfoPrintable,
    };
}

/**
 * Generates AstId.
 * @param scope Current scope, from which AstId.text will be generated.
 * @param kind Entity for which AstId is generated.
 * @param shadowing Allow shadowing (using names available in parent scopes)
 */
export function generateAstId(
    scope: Scope,
    kind: ScopeItemKind,
    shadowing: boolean = true,
    isType: boolean = false,
): fc.Arbitrary<AstId> {
    return fc.record({
        kind: fc.constant("id"),
        text: generateName(scope, kind, shadowing, isType),
        id: fc.constant(nextId()),
        loc: fc.constant(dummySrcInfoPrintable),
    });
}

/**
 * Chooses an arbitrary identifier available in the current scope.
 * @returns Chosen identifier or `undefined` if there are no identifiers available with the given kind/type.
 */
export function choose(
    scope: Scope,
    kind: ScopeItemKind,
    ty: Type,
): string | undefined {
    const availableNames = scope.getNamesRecursive(kind, ty);
    if (availableNames.length === 0) {
        return undefined;
    }
    return createSample(fc.constantFrom(...availableNames));
}

/**
 * Randomly chooses a boolean value using wrt to SEED.
 */
export function randomBool(): boolean {
    return createSample(fc.boolean());
}

/**
 * Randomly chooses an integer value using wrt to SEED.
 */
export function randomInt(min: number, max: number): number {
    return createSample(fc.integer({ min, max }));
}

/**
 * Chooses a random list element wrt to SEED.
 */
export function randomElement<T>(list: T[]): T {
    if (list.length === 0) {
        throw new Error("Empty list");
    }
    if (list.length === 1) {
        return list[0];
    }
    return list[randomInt(1, list.length - 1)];
}

export function packArbitraries<T>(
    arbs?: fc.Arbitrary<T>[],
): fc.Arbitrary<T[]> {
    return arbs ? fc.tuple(...(arbs as [fc.Arbitrary<T>])) : fc.constant([]);
}

export const dummySrcInfoPrintable = getSrcInfo(" ", 0, 0, null, "user");