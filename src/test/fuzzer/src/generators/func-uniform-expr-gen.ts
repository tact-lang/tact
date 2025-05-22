import type * as Ast from "@/ast/ast";
import { FuzzContext } from "@/test/fuzzer/src/context";
import type { Scope } from "@/test/fuzzer/src/scope";
import { StdlibType } from "@/test/fuzzer/src/types";
import type { Type } from "@/test/fuzzer/src/types";
import { packArbitraries, stringify } from "@/test/fuzzer/src/util";
import { beginCell } from "@ton/core";
import type { Address, Cell } from "@ton/core";
import { sha256_sync } from "@ton/crypto";
import { TreasuryContract } from "@ton/sandbox";
import * as fc from "fast-check";

export const FunCNonTerminal = {
    Initial: { terminal: false, literal: false, id: 0 },
    Int: { terminal: false, literal: false, id: 1 },
    LiteralInt: { terminal: false, literal: true, id: 2 },
    // The following non-terminals represent optionals that can only be assigned at the top-level in variable
    // declarations, but not inside expressions where they can be dereferenced with operator !!
    // For example:
    // let a: Int? = null
    // let a: Int? = 5 == 4 ? null : 10
    //
    // But not: (because null has an ambigous type):
    // let a = Int = null!!
    TopOptInt: { terminal: false, literal: false, id: 3 },
} as const;

export type FunCNonTerminalEnum =
    (typeof FunCNonTerminal)[keyof typeof FunCNonTerminal];

export const FunCTerminal = {
    integer: { terminal: true, id: 1 },
    add: { terminal: true, id: 2 },
    minus: { terminal: true, id: 3 },
    mult: { terminal: true, id: 4 },
    div: { terminal: true, id: 5 },
    mod: { terminal: true, id: 6 },
    shift_r: { terminal: true, id: 7 },
    shift_l: { terminal: true, id: 8 },
    bit_and: { terminal: true, id: 9 },
    bit_or: { terminal: true, id: 10 },
    bit_xor: { terminal: true, id: 11 },

    unary_minus: { terminal: true, id: 12 },
    bit_not: { terminal: true, id: 13 },

    //bool: { terminal: true, id: 14 },
    eq: { terminal: true, id: 15 },
    neq: { terminal: true, id: 16 },
    lt: { terminal: true, id: 17 },
    le: { terminal: true, id: 18 },
    gt: { terminal: true, id: 19 },
    ge: { terminal: true, id: 20 },
    //and: { terminal: true, id: 21 },
    //or: { terminal: true, id: 22 },
    //not: { terminal: true, id: 23 },

    //cell: { terminal: true, id: 24 },
    //code_of: { terminal: true, id: 25 },

    //slice: { terminal: true, id: 25 },

    //address: { terminal: true, id: 26 },

    //string: { terminal: true, id: 27 },

    // opt_inj: { terminal: true, id: 30 },
    //null: { terminal: true, id: 28 },
    //non_null_assert: { terminal: true, id: 29 },

    cond: { terminal: true, id: 30 },

    id_int: { terminal: true, id: 31 },
    id_opt_int: { terminal: true, id: 32 },
    id_bool: { terminal: true, id: 33 },
    id_opt_bool: { terminal: true, id: 34 },
    id_cell: { terminal: true, id: 35 },
    id_opt_cell: { terminal: true, id: 36 },
    id_slice: { terminal: true, id: 37 },
    id_opt_slice: { terminal: true, id: 38 },
    id_address: { terminal: true, id: 39 },
    id_opt_address: { terminal: true, id: 40 },
    id_string: { terminal: true, id: 41 },
    id_opt_string: { terminal: true, id: 42 },

    round_div: { terminal: true, id: 70 },
    ceil_div: { terminal: true, id: 71 },
    round_mod: { terminal: true, id: 72 },
    ceil_mod: { terminal: true, id: 73 },
    //div_mod: { terminal: true, id: 74 },
    round_shift_r: { terminal: true, id: 75 },
    ceil_shift_r: { terminal: true, id: 76 },
    comparison: { terminal: true, id: 77 },
    muldiv: { terminal: true, id: 78 },
    ceil_muldiv: { terminal: true, id: 79 },
    round_muldiv: { terminal: true, id: 80 },
} as const;

export type FunCTerminalEnum = (typeof FunCTerminal)[keyof typeof FunCTerminal];

export type EdgeCaseConfig = {
    // On each integer node, try the following integer values, in addition to the existing node
    tryIntegerValues: bigint[];

    // On each boolean node, try the following boolean values, in addition to the existing node
    tryBooleanValues: boolean[];

    // On each string node, try the following string values, in addition to the existing node
    tryStringValues: string[];

    // On each integer node, try to replace it with an identifier in the scope.
    generalizeIntegerToIdentifier: boolean;

    // On each boolean node, try to replace it with an identifier in the scope.
    generalizeBooleanToIdentifier: boolean;

    // On each string node, try to replace it with an identifier in the scope.
    generalizeStringToIdentifier: boolean;

    // On each identifier node, check if the identifier is an integer. If so, instantiate it with any
    // integer edge case in tryIntegerValues.
    instantiateIntIds: boolean;

    // On each identifier node, check if the identifier is a boolean. If so, instantiate it with any
    // boolean edge case in tryBooleanValues.
    instantiateBoolIds: boolean;
};

export type GenInitConfig = {
    // The minimum expression size
    minSize: number;

    // The maximum expression size
    maxSize: number;

    // The non-terminals to choose from. Non-terminals not listed here will
    // be disallowed during generation
    allowedNonTerminals: FunCNonTerminalEnum[];

    // The terminals to choose from. Terminals not listed here will
    // be disallowed during generation
    allowedTerminals: FunCTerminalEnum[];

    useIdentifiers: boolean;
};

type GenericNonTerminal = {
    id: number;
    literal: boolean;
    terminal: false;
};

type Token = FunCTerminalEnum | GenericNonTerminal;

type ExprProduction = {
    tokens: Token[];
    id: number;
};

const allProductions: ExprProduction[][] = [
    [
        // Productions for Initial
        { id: 0, tokens: [FunCNonTerminal.Int] },
        //{ id: 1, tokens: [NonTerminal.OptInt] },
        { id: 2, tokens: [FunCNonTerminal.LiteralInt] },
        // { id: 3, tokens: [NonTerminal.LiteralOptInt] },
        //{ id: 3, tokens: [NonTerminal.Bool] },
        //{ id: 4, tokens: [NonTerminal.OptBool] },
        //{ id: 5, tokens: [NonTerminal.LiteralBool] },
        // { id: 7, tokens: [NonTerminal.LiteralOptBool] },
        //{ id: 6, tokens: [NonTerminal.Cell] },
        //{ id: 7, tokens: [NonTerminal.OptCell] },
        //{ id: 8, tokens: [NonTerminal.LiteralCell] },
        // { id: 11, tokens: [NonTerminal.LiteralOptCell] },
        //{ id: 9, tokens: [NonTerminal.Slice] },
        //{ id: 10, tokens: [NonTerminal.OptSlice] },
        //{ id: 11, tokens: [NonTerminal.LiteralSlice] },
        // { id: 15, tokens: [NonTerminal.LiteralOptSlice] },
        //{ id: 12, tokens: [NonTerminal.Address] },
        //{ id: 13, tokens: [NonTerminal.OptAddress] },
        //{ id: 14, tokens: [NonTerminal.LiteralAddress] },
        // { id: 19, tokens: [NonTerminal.LiteralOptAddress] },
        //{ id: 15, tokens: [NonTerminal.String] },
        //{ id: 16, tokens: [NonTerminal.LiteralString] },
        //{ id: 17, tokens: [NonTerminal.OptString] },
        // { id: 23, tokens: [NonTerminal.LiteralOptString] },
    ],
    [
        // Productions for Int
        {
            id: 0,
            tokens: [
                FunCTerminal.add,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 1,
            tokens: [
                FunCTerminal.minus,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 2,
            tokens: [
                FunCTerminal.mult,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 3,
            tokens: [
                FunCTerminal.div,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 4,
            tokens: [
                FunCTerminal.mod,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 5,
            tokens: [
                FunCTerminal.shift_r,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 6,
            tokens: [
                FunCTerminal.shift_l,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 7,
            tokens: [
                FunCTerminal.bit_and,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 8,
            tokens: [
                FunCTerminal.bit_or,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 9,
            tokens: [
                FunCTerminal.bit_xor,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        // { id: 10, tokens: [Terminal.unary_plus, NonTerminal.Int] },
        { id: 10, tokens: [FunCTerminal.unary_minus, FunCNonTerminal.Int] },
        { id: 11, tokens: [FunCTerminal.bit_not, FunCNonTerminal.Int] },
        {
            id: 12,
            tokens: [
                FunCTerminal.cond,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        { id: 13, tokens: [FunCTerminal.id_int] },
        { id: 14, tokens: [FunCNonTerminal.LiteralInt] },

        {
            id: 15,
            tokens: [FunCTerminal.eq, FunCNonTerminal.Int, FunCNonTerminal.Int],
        },
        {
            id: 16,
            tokens: [
                FunCTerminal.neq,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 17,
            tokens: [FunCTerminal.lt, FunCNonTerminal.Int, FunCNonTerminal.Int],
        },
        {
            id: 18,
            tokens: [FunCTerminal.le, FunCNonTerminal.Int, FunCNonTerminal.Int],
        },
        {
            id: 19,
            tokens: [FunCTerminal.gt, FunCNonTerminal.Int, FunCNonTerminal.Int],
        },
        {
            id: 20,
            tokens: [FunCTerminal.ge, FunCNonTerminal.Int, FunCNonTerminal.Int],
        },
        {
            id: 21,
            tokens: [
                FunCTerminal.round_div,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 22,
            tokens: [
                FunCTerminal.ceil_div,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 23,
            tokens: [
                FunCTerminal.round_mod,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 24,
            tokens: [
                FunCTerminal.ceil_mod,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 25,
            tokens: [
                FunCTerminal.round_shift_r,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 26,
            tokens: [
                FunCTerminal.ceil_shift_r,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 27,
            tokens: [
                FunCTerminal.comparison,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 28,
            tokens: [
                FunCTerminal.muldiv,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 29,
            tokens: [
                FunCTerminal.ceil_muldiv,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        {
            id: 30,
            tokens: [
                FunCTerminal.round_muldiv,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
                FunCNonTerminal.Int,
            ],
        },
        //{ id: 31, tokens: [FunCTerminal.div_mod, FunCNonTerminal.Int, FunCNonTerminal.Int] },
    ],
    [
        // Productions for LiteralInt
        { id: 0, tokens: [FunCTerminal.integer] },
    ],
    [
        // Productions for TopOptInt
        {
            id: 0,
            tokens: [
                FunCTerminal.cond,
                FunCNonTerminal.Int,
                FunCNonTerminal.TopOptInt,
                FunCNonTerminal.TopOptInt,
            ],
        },
        //{ id: 1, tokens: [FunCTerminal.id_opt_int] },
        //{ id: 2, tokens: [FunCTerminal.null] },
        { id: 1, tokens: [FunCNonTerminal.Int] },
    ],
];

function sum(counts: number[]): number {
    // If at least one array element (which are counts represented as logarithms) is -Inf, it means that they represent the count 0.
    // therefore, they can be filtered out from the array, because they will not affect the final sum
    const filteredCounts = counts.filter((n) => n !== Number.NEGATIVE_INFINITY);

    if (filteredCounts.length === 0) {
        // The sum would be 0. So, return -Inf
        return Number.NEGATIVE_INFINITY;
    }
    if (filteredCounts.length === 1) {
        return filteredCounts[0]!;
    }
    const first = filteredCounts[0]!;
    // For the general case, we reduce the array thanks to the following formula:
    // log(x + y) = log x + log(1 + 2^(log y - log x))
    // which tells us how we should add counts when they are represented as logarithms
    return filteredCounts
        .slice(1)
        .reduce(
            (prev, curr) => prev + Math.log2(1 + 2 ** (curr - prev)),
            first,
        );
}

function normalizeArray(counts: number[]): number[] {
    // Any -Inf represents a count of 0, which means that such index should never get selected.
    // So, it is enough to transform -Inf back to 0.
    // Any 0 represents a count of 1. Since such index has a non-zero probability to be selected,
    // we change the 0s to 1s.
    // Also, 1 represents a count of 2. So, we transform 1s to 2s, to avoid
    // squashing counts 1s and 2s together.
    // The rest of numbers we take their ceil to transform them into integers.
    return counts.map((n) => {
        if (n === Number.NEGATIVE_INFINITY) {
            return 0;
        }
        if (n === 0) {
            return 1;
        }
        if (n === 1) {
            return 2;
        }
        return Math.ceil(n);
    });
}

function multiply(first: number, second: number): number {
    // If at least one input (which are counts represented as logarithms) is -Inf, it means that they represent the count 0.
    // therefore, their multiplication is also 0 (or -Inf in the logarithm representation)
    if (
        first === Number.NEGATIVE_INFINITY ||
        second === Number.NEGATIVE_INFINITY
    ) {
        return Number.NEGATIVE_INFINITY;
    } else {
        // To multiply two counts represented as logarithms, it is enough to add their representations
        // thanks to this formula:
        // log(x * y) = log(x) + log(y)
        return first + second;
    }
}

function transform(n: number): number {
    // We transform counts into their base-2 logarithmic representation
    return Math.log2(n);
}

function filterProductions(initConfig: GenInitConfig): {
    productions: ExprProduction[][];
    nonTerminals: GenericNonTerminal[];
    reindexMap: Map<number, number>;
} {
    const nonTerminalIdsToInclude: Set<number> = new Set(
        initConfig.allowedNonTerminals.map((e) => e.id),
    );
    const terminalIdsToInclude: Set<number> = new Set(
        initConfig.allowedTerminals.map((e) => e.id),
    );

    // Make a copy of all the productions
    let productions: ExprProduction[][] = [];
    for (let i = 0; i < allProductions.length; i++) {
        productions[i] = allProductions[i]!.map((prod) => {
            return { id: prod.id, tokens: prod.tokens };
        });
    }

    // If flag useIdentifiers is off, remove generation of identifiers
    if (!initConfig.useIdentifiers) {
        [
            FunCTerminal.id_address,
            FunCTerminal.id_bool,
            FunCTerminal.id_cell,
            FunCTerminal.id_int,
            FunCTerminal.id_opt_address,
            FunCTerminal.id_opt_bool,
            FunCTerminal.id_opt_cell,
            FunCTerminal.id_opt_int,
            FunCTerminal.id_opt_slice,
            FunCTerminal.id_opt_string,
            FunCTerminal.id_slice,
            FunCTerminal.id_string,
        ].forEach((terminal) => {
            terminalIdsToInclude.delete(terminal.id);
        });
    }

    // Remove productions that use terminals and non-terminals not listed in the allowed lists.
    let initialNonTerminalsCount;
    do {
        initialNonTerminalsCount = nonTerminalIdsToInclude.size;

        for (let i = 0; i < productions.length; i++) {
            productions[i] = productions[i]!.filter((prod) =>
                prod.tokens.every((t) => {
                    if (t.terminal) {
                        return terminalIdsToInclude.has(t.id);
                    } else {
                        return nonTerminalIdsToInclude.has(t.id);
                    }
                }),
            );
            // If non-terminal i has no productions at the end, we need
            // to remove i from the final non-terminals
            // and go again through the process of removing productions
            if (productions[i]!.length === 0) {
                nonTerminalIdsToInclude.delete(i);
            }
        }
    } while (initialNonTerminalsCount !== nonTerminalIdsToInclude.size);

    // Remove unused non-terminals, and reindex them
    const reindexMap: Map<number, number> = new Map();
    const nonTerminalsFiltered = Object.values(FunCNonTerminal).filter((n) =>
        nonTerminalIdsToInclude.has(n.id),
    );
    nonTerminalsFiltered.forEach((n, newIndex) => {
        reindexMap.set(n.id, newIndex);
    });
    const nonTerminals = nonTerminalsFiltered.map((n, newIndex) => {
        return { id: newIndex, literal: n.literal, terminal: n.terminal };
    });

    // Remove productions belonging to removed non-terminals.
    productions = productions.filter((_, index) =>
        nonTerminalIdsToInclude.has(index),
    );

    // Reindex all the productions, including non-terminal tokens occurring inside the production
    for (let i = 0; i < productions.length; i++) {
        productions[i] = productions[i]!.map((prod, newIndex) => {
            return {
                id: newIndex,
                tokens: prod.tokens.map((t) => {
                    if (t.terminal) {
                        return t;
                    } else {
                        const newIndex = reindexMap.get(t.id);
                        if (typeof newIndex === "undefined") {
                            throw new Error(
                                `Invalid old index ${t.id}: it does not have a re-indexing`,
                            );
                        }
                        return {
                            id: newIndex,
                            literal: t.literal,
                            terminal: t.terminal,
                        };
                    }
                }),
            };
        });
    }

    return {
        productions,
        nonTerminals,
        reindexMap,
    };
}

function computeCountTables(
    minSize: number,
    maxSize: number,
    finalProductions: ExprProduction[][],
    nonTerminals: GenericNonTerminal[],
): {
    nonTerminalCounts: number[][][];
    sizeSplitCounts: number[][][][][];
    totalCounts: number[][];
} {
    const nonTerminalCounts: number[][][] = [];
    const sizeSplitCounts: number[][][][][] = [];
    const totalCounts: number[][] = [];

    function updateTotalCounts(idx: number, size: number, count: number) {
        if (typeof totalCounts[idx] === "undefined") {
            totalCounts[idx] = Array(maxSize + 1);
            totalCounts[idx][size] = count;
        } else {
            totalCounts[idx][size] = count;
        }
    }

    function updateNonTerminalCounts(
        idx: number,
        size: number,
        counts: number[],
    ) {
        if (typeof nonTerminalCounts[idx] === "undefined") {
            nonTerminalCounts[idx] = Array(maxSize + 1);
            nonTerminalCounts[idx][size] = counts;
        } else {
            nonTerminalCounts[idx][size] = counts;
        }
    }

    function peekNonTerminalCounts(
        idx: number,
        size: number,
    ): number[] | undefined {
        if (typeof nonTerminalCounts[idx] !== "undefined") {
            return nonTerminalCounts[idx][size];
        } else {
            return undefined;
        }
    }

    function updateSizeSplitCounts(
        nonTerminalIndex: number,
        prodIndex: number,
        tokenIndex: number,
        size: number,
        counts: number[],
    ) {
        const prods = getProductions(finalProductions, nonTerminalIndex);
        const prod = getProductionAt(prods, prodIndex);

        if (typeof sizeSplitCounts[nonTerminalIndex] === "undefined") {
            sizeSplitCounts[nonTerminalIndex] = Array(prods.length);
            sizeSplitCounts[nonTerminalIndex][prodIndex] = Array(
                prod.tokens.length,
            );
            sizeSplitCounts[nonTerminalIndex][prodIndex][tokenIndex] = Array(
                maxSize + 1,
            );
            sizeSplitCounts[nonTerminalIndex][prodIndex][tokenIndex][size] =
                counts;
            return;
        } else {
            if (
                typeof sizeSplitCounts[nonTerminalIndex][prodIndex] ===
                "undefined"
            ) {
                sizeSplitCounts[nonTerminalIndex][prodIndex] = Array(
                    prod.tokens.length,
                );
                sizeSplitCounts[nonTerminalIndex][prodIndex][tokenIndex] =
                    Array(maxSize + 1);
                sizeSplitCounts[nonTerminalIndex][prodIndex][tokenIndex][size] =
                    counts;
                return;
            }
            if (
                typeof sizeSplitCounts[nonTerminalIndex][prodIndex][
                    tokenIndex
                ] === "undefined"
            ) {
                sizeSplitCounts[nonTerminalIndex][prodIndex][tokenIndex] =
                    Array(maxSize + 1);
                sizeSplitCounts[nonTerminalIndex][prodIndex][tokenIndex][size] =
                    counts;
                return;
            }
            sizeSplitCounts[nonTerminalIndex][prodIndex][tokenIndex][size] =
                counts;
        }
    }

    function peekSizeSplitCounts(
        nonTerminalIndex: number,
        prodIndex: number,
        tokenIndex: number,
        size: number,
    ): number[] | undefined {
        return sizeSplitCounts[nonTerminalIndex]?.[prodIndex]?.[tokenIndex]?.[
            size
        ];
    }

    function countFromNonTerminal(id: number, size: number): number[] {
        const peekedCounts = peekNonTerminalCounts(id, size);
        if (typeof peekedCounts !== "undefined") {
            return peekedCounts;
        }
        const prods = getProductions(finalProductions, id);
        return prods.map((prod) => sum(countFromProduction(id, prod, 0, size)));
    }

    function countFromProduction(
        nonTerminalIndex: number,
        production: ExprProduction,
        tokenIndex: number,
        size: number,
    ): number[] {
        if (size === 0) {
            return [];
        }
        const peekedCounts = peekSizeSplitCounts(
            nonTerminalIndex,
            production.id,
            tokenIndex,
            size,
        );
        if (typeof peekedCounts !== "undefined") {
            return peekedCounts;
        }
        const head = getTokenAt(production.tokens, tokenIndex);
        if (head.terminal) {
            if (tokenIndex === production.tokens.length - 1) {
                // i.e., the head is the last symbol in the production
                // Transform the values 1 and 0 to whatever representation of counts we are currently using
                return size === 1 ? [transform(1)] : [transform(0)];
            } else {
                return [
                    sum(
                        countFromProduction(
                            nonTerminalIndex,
                            production,
                            tokenIndex + 1,
                            size - 1,
                        ),
                    ),
                ];
            }
        }
        // head is not a terminal
        if (tokenIndex === production.tokens.length - 1) {
            // i.e., the head is the last symbol in the production
            return [sum(countFromNonTerminal(head.id, size))];
        } else {
            const result: number[] = [];

            for (
                let l = 1;
                l <= size - production.tokens.length + tokenIndex + 1;
                l++
            ) {
                const partition1 = sum(countFromNonTerminal(head.id, l));
                const partition2 = sum(
                    countFromProduction(
                        nonTerminalIndex,
                        production,
                        tokenIndex + 1,
                        size - l,
                    ),
                );
                result.push(multiply(partition1, partition2));
            }
            return result;
        }
    }

    function doCountsForNonTerminals(nonTerminals: GenericNonTerminal[]) {
        // First, compute the counts of all the non-terminals that produce literals

        // The first step is to initialize the tables for size 0
        for (const nonTerminal of nonTerminals) {
            const nonTerminalIdx = nonTerminal.id;

            const productions = getProductions(
                finalProductions,
                nonTerminalIdx,
            );

            // Transform count 0 to whatever representation of counts we are currently using
            updateNonTerminalCounts(
                nonTerminalIdx,
                0,
                productions.map((_) => transform(0)),
            );

            for (const prod of productions) {
                for (
                    let tokenIndx = 0;
                    tokenIndx < prod.tokens.length;
                    tokenIndx++
                ) {
                    updateSizeSplitCounts(
                        nonTerminalIdx,
                        prod.id,
                        tokenIndx,
                        0,
                        [],
                    );
                }
            }
        }

        // Now, for the rest of sizes
        for (let size = 1; size <= maxSize; size++) {
            for (const nonTerminal of nonTerminals) {
                const nonTerminalIdx = nonTerminal.id;

                const productions = getProductions(
                    finalProductions,
                    nonTerminalIdx,
                );

                for (const prod of productions) {
                    for (
                        let tokenIndx = 0;
                        tokenIndx < prod.tokens.length;
                        tokenIndx++
                    ) {
                        updateSizeSplitCounts(
                            nonTerminalIdx,
                            prod.id,
                            tokenIndx,
                            size,
                            countFromProduction(
                                nonTerminalIdx,
                                prod,
                                tokenIndx,
                                size,
                            ),
                        );
                    }
                }

                updateNonTerminalCounts(
                    nonTerminalIdx,
                    size,
                    countFromNonTerminal(nonTerminalIdx, size),
                );
            }
        }
    }

    function doTotalCounts() {
        // From 0 to minSize-1, set counts to 0, since we are not going to choose those sizes
        // Transform the count 0 to whatever representation we are currently using
        for (let size = 0; size < minSize; size++) {
            for (const nonTerminal of nonTerminals) {
                updateTotalCounts(nonTerminal.id, size, transform(0));
            }
        }

        for (let size = minSize; size <= maxSize; size++) {
            for (const nonTerminal of nonTerminals) {
                updateTotalCounts(
                    nonTerminal.id,
                    size,
                    sum(
                        lookupNonTerminalCounts(
                            nonTerminalCounts,
                            nonTerminal.id,
                            size,
                        ),
                    ),
                );
            }
        }
    }

    function normalizeCounts() {
        // The total counts
        for (const nonTerminal of nonTerminals) {
            const counts = totalCounts[nonTerminal.id];
            if (typeof counts === "undefined") {
                throw new Error(`Index ${nonTerminal.id} out of bounds`);
            }
            const newCounts = normalizeArray(counts);
            totalCounts[nonTerminal.id] = newCounts;
        }

        // The non-terminal counts
        for (const nonTerminal of nonTerminals) {
            for (let size = 0; size <= maxSize; size++) {
                const counts = lookupNonTerminalCounts(
                    nonTerminalCounts,
                    nonTerminal.id,
                    size,
                );
                const newCounts = normalizeArray(counts);
                updateNonTerminalCounts(nonTerminal.id, size, newCounts);
            }
        }

        // Split size counts
        for (const nonTerminal of nonTerminals) {
            const nonTerminalIdx = nonTerminal.id;

            const productions = getProductions(
                finalProductions,
                nonTerminalIdx,
            );

            for (const prod of productions) {
                for (
                    let tokenIndx = 0;
                    tokenIndx < prod.tokens.length;
                    tokenIndx++
                ) {
                    for (let size = 0; size <= maxSize; size++) {
                        const counts = lookupSizeSplitCounts(
                            sizeSplitCounts,
                            nonTerminal.id,
                            prod.id,
                            tokenIndx,
                            size,
                        );
                        const newCounts = normalizeArray(counts);
                        updateSizeSplitCounts(
                            nonTerminal.id,
                            prod.id,
                            tokenIndx,
                            size,
                            newCounts,
                        );
                    }
                }
            }
        }
    }

    // First, fill the non-terminals that compute literals
    doCountsForNonTerminals(
        nonTerminals.filter((nonTerminal) => nonTerminal.literal),
    );

    // Now the rest of non-terminals
    doCountsForNonTerminals(
        nonTerminals.filter((nonTerminal) => !nonTerminal.literal),
    );

    doTotalCounts();

    // Now that the tables are filled, we need to normalize the counts
    // into non-negative integers (because they may be currently encoded
    // in a different way. For example, when using logarithms to represent
    // counts, the numbers have fractional part, and may also include -Inf).
    normalizeCounts();

    return {
        nonTerminalCounts,
        sizeSplitCounts,
        totalCounts,
    };
}

function lookupSizeSplitCounts(
    sizeSplitCounts: number[][][][][],
    nonTerminalIndex: number,
    prodIndex: number,
    tokenIndex: number,
    size: number,
): number[] {
    const nTCounts = sizeSplitCounts[nonTerminalIndex];
    if (typeof nTCounts === "undefined") {
        throw new Error(`Index ${nonTerminalIndex} out of bounds`);
    }
    const prodCounts = nTCounts[prodIndex];
    if (typeof prodCounts === "undefined") {
        throw new Error(`Index ${prodIndex} out of bounds`);
    }
    const tokenCounts = prodCounts[tokenIndex];
    if (typeof tokenCounts === "undefined") {
        throw new Error(`Index ${tokenIndex} out of bounds`);
    }
    const result = tokenCounts[size];
    if (typeof result === "undefined") {
        throw new Error(`Index ${size} out of bounds`);
    }
    return result;
}

function lookupNonTerminalCounts(
    nonTerminalCounts: number[][][],
    nonTerminalIndex: number,
    size: number,
): number[] {
    const nTCounts = nonTerminalCounts[nonTerminalIndex];
    if (typeof nTCounts === "undefined") {
        throw new Error(`Index ${nonTerminalIndex} out of bounds`);
    }
    const result = nTCounts[size];
    if (typeof result === "undefined") {
        throw new Error(`Index ${size} out of bounds`);
    }
    return result;
}

function lookupTotalCounts(
    totalCounts: number[][],
    nonTerminalIndex: number,
): number[] {
    const nTCounts = totalCounts[nonTerminalIndex];
    if (typeof nTCounts === "undefined") {
        throw new Error(`Index ${nonTerminalIndex} out of bounds`);
    }
    return nTCounts;
}

function getProductions(
    productions: ExprProduction[][],
    idx: number,
): ExprProduction[] {
    const prods = productions[idx];
    if (typeof prods === "undefined") {
        throw new Error(`${idx} is not a valid id for a non-terminal`);
    }
    return prods;
}

function getTokenAt(tokens: Token[], id: number): Token {
    const token = tokens[id];
    if (typeof token === "undefined") {
        throw new Error(`Index ${id} is out of bounds`);
    }
    return token;
}

function getNonTerminalAt(tokens: Token[], id: number): GenericNonTerminal {
    const token = getTokenAt(tokens, id);
    if (token.terminal) {
        throw new Error(`Was expecting a non-terminal`);
    }
    return token;
}

function getProductionAt(prods: ExprProduction[], id: number): ExprProduction {
    const prod = prods[id];
    if (typeof prod === "undefined") {
        throw new Error(`Index ${id} out of bounds in productions array`);
    }
    return prod;
}

function makeExpression(
    nonTerminalId: number,
    scope: Scope,
    nonTerminalCounts: number[][][],
    sizeSplitCounts: number[][][][][],
    finalProductions: ExprProduction[][],
    size: number,
): fc.Arbitrary<string> {
    function genFromNonTerminal(
        id: number,
        size: number,
    ): fc.Arbitrary<string> {
        const prods = getProductions(finalProductions, id);
        const nonTerminalOptions = lookupNonTerminalCounts(
            nonTerminalCounts,
            id,
            size,
        );

        const weightedNonTerminalOptions: fc.WeightedArbitrary<number>[] =
            nonTerminalOptions.map((w, i) => {
                return { arbitrary: fc.constant(i), weight: w };
            });
        return fc
            .oneof(...weightedNonTerminalOptions)
            .chain((chosenProdIndex) => {
                const production = getProductionAt(prods, chosenProdIndex);
                return genFromProduction(id, production, size);
            });
    }

    function genFromProduction(
        nonTerminalIndex: number,
        production: ExprProduction,
        size: number,
    ): fc.Arbitrary<string> {
        const head = getTokenAt(production.tokens, 0);
        if (head.terminal) {
            // The production must have the form: N -> head list_of_non_terminals
            // where head indicates the kind of tree we need to produce
            return makeTree(
                nonTerminalIndex,
                production.id,
                head,
                production.tokens.slice(1),
                size,
            );
        }
        // head is not a terminal
        // The production must have the form N -> head
        return genFromNonTerminal(head.id, size);
    }

    function chooseSizeSplit(
        nonTerminalIndex: number,
        prodIndex: number,
        tokenIndex: number,
        size: number,
    ): fc.Arbitrary<number> {
        const sizeSplits = lookupSizeSplitCounts(
            sizeSplitCounts,
            nonTerminalIndex,
            prodIndex,
            tokenIndex,
            size,
        );
        // We need to add 1 to the result because sizes
        // in splits are always positive. So, index 0
        // represents size 1, and so on.
        const weightedSizeSplits: fc.WeightedArbitrary<number>[] =
            sizeSplits.map((w, i) => {
                return { arbitrary: fc.constant(i + 1), weight: w };
            });
        return fc.oneof(...weightedSizeSplits);
    }

    /*
    function handleShiftOperators(
        op: Ast.BinaryOperation,
        expr: Ast.Expression,
    ): fc.Arbitrary<Ast.Expression> {
        if (op !== "<<" && op !== ">>") {
            return fc.constant(expr);
        }
        try {
            const literal = interpreter.interpretExpression(expr);
            if (literal.kind !== "number") {
                // Generate an integer in range [0..256]
                return fc
                    .bigInt(0n, 256n)
                    .map((n) => makeF.makeDummyNumber(10, n));
            }
            if (literal.value >= 0n && literal.value <= 256n) {
                return fc.constant(expr);
            } else {
                // Generate an integer in range [0..256]
                return fc
                    .bigInt(0n, 256n)
                    .map((n) => makeF.makeDummyNumber(10, n));
            }
        } catch (_) {
            // Any kind of error, leave the expr as is
            return fc.constant(expr);
        }
    }
*/
    function makeBinaryOperatorTree(
        op: string,
        nonTerminalIndex: number,
        prodIndex: number,
        rest: Token[],
        size: number,
    ): fc.Arbitrary<string> {
        const currSize = size - 1;
        // Choose a single split for the size
        return chooseSizeSplit(nonTerminalIndex, prodIndex, 1, currSize).chain(
            (sizeSplit) => {
                const leftNonTerminal = getNonTerminalAt(rest, 0);
                const rightNonTerminal = getNonTerminalAt(rest, 1);

                return genFromNonTerminal(leftNonTerminal.id, sizeSplit).chain(
                    (leftOperand) => {
                        return genFromNonTerminal(
                            rightNonTerminal.id,
                            currSize - sizeSplit,
                        ).map((rightOperand) => {
                            // We need special logic to handle the shift operators, because they check
                            // at compile time if their right-hand side is within the range [0..256].
                            return `(${leftOperand} ${op} ${rightOperand})`;
                        });
                    },
                );
            },
        );
    }

    function makeUnaryOperatorTree(
        op: string,
        rest: Token[],
        size: number,
    ): fc.Arbitrary<string> {
        const currSize = size - 1;

        const operandNonTerminal = getNonTerminalAt(rest, 0);
        return genFromNonTerminal(operandNonTerminal.id, currSize).map(
            (operand) => `(${op} ${operand})`,
        );
    }

    function makeTernaryOperatorTree(
        nonTerminalIndex: number,
        prodIndex: number,
        rest: Token[],
        size: number,
        builder: (firstOp: string, secondOp: string, thirdOp: string) => string,
    ): fc.Arbitrary<string> {
        const currSize = size - 1;
        // Choose two splits for the size
        return chooseSizeSplit(nonTerminalIndex, prodIndex, 1, currSize).chain(
            (sizeSplit1) => {
                return chooseSizeSplit(
                    nonTerminalIndex,
                    prodIndex,
                    2,
                    currSize - sizeSplit1,
                ).chain((sizeSplit2) => {
                    const firstTerminal = getNonTerminalAt(rest, 0);
                    const secondTerminal = getNonTerminalAt(rest, 1);
                    const thirdTerminal = getNonTerminalAt(rest, 2);

                    return genFromNonTerminal(
                        firstTerminal.id,
                        sizeSplit1,
                    ).chain((firstOperand) => {
                        return genFromNonTerminal(
                            secondTerminal.id,
                            sizeSplit2,
                        ).chain((secondOperand) => {
                            return genFromNonTerminal(
                                thirdTerminal.id,
                                currSize - sizeSplit1 - sizeSplit2,
                            ).map((thirdOperand) =>
                                builder(
                                    firstOperand,
                                    secondOperand,
                                    thirdOperand,
                                ),
                            );
                        });
                    });
                });
            },
        );
    }

    function makeIdentifier(ty: Type): fc.Arbitrary<string> {
        const names = [
            ...scope.getNamesRecursive("let", ty),
            ...scope.getNamesRecursive("parameter", ty),
        ];

        if (names.length === 0) {
            throw new Error(
                `There must exist at least one identifier for type ${stringify(ty, 0)}`,
            );
        }
        return fc.constantFrom(...names);
    }

    function makeTree(
        nonTerminalIndex: number,
        prodIndex: number,
        head: FunCTerminalEnum,
        rest: Token[],
        size: number,
    ): fc.Arbitrary<string> {
        switch (head.id) {
            case FunCTerminal.integer.id: {
                return generateIntBitLength(257, true).map((i) => i.toString());
            }
            case FunCTerminal.add.id: {
                return makeBinaryOperatorTree(
                    "+",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.minus.id: {
                return makeBinaryOperatorTree(
                    "-",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.mult.id: {
                return makeBinaryOperatorTree(
                    "*",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.div.id: {
                return makeBinaryOperatorTree(
                    "/",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.mod.id: {
                return makeBinaryOperatorTree(
                    "%",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.shift_r.id: {
                return makeBinaryOperatorTree(
                    ">>",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.shift_l.id: {
                return makeBinaryOperatorTree(
                    "<<",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.bit_and.id: {
                return makeBinaryOperatorTree(
                    "&",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.bit_or.id: {
                return makeBinaryOperatorTree(
                    "|",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.bit_xor.id: {
                return makeBinaryOperatorTree(
                    "^",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            // case Terminal.unary_plus.id: {
            //     return makeUnaryOperatorTree("+", rest, size);
            // }
            case FunCTerminal.unary_minus.id: {
                return makeUnaryOperatorTree("-", rest, size);
            }
            case FunCTerminal.bit_not.id: {
                return makeUnaryOperatorTree("~", rest, size);
            }
            //case FunCTerminal.bool.id: {
            //    return fc.boolean().map((b) => b.toString());
            //}
            case FunCTerminal.eq.id: {
                return makeBinaryOperatorTree(
                    "==",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.neq.id: {
                return makeBinaryOperatorTree(
                    "!=",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.lt.id: {
                return makeBinaryOperatorTree(
                    "<",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.le.id: {
                return makeBinaryOperatorTree(
                    "<=",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.gt.id: {
                return makeBinaryOperatorTree(
                    ">",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.ge.id: {
                return makeBinaryOperatorTree(
                    ">=",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.round_div.id: {
                return makeBinaryOperatorTree(
                    "~/",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.ceil_div.id: {
                return makeBinaryOperatorTree(
                    "^/",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.muldiv.id: {
                return makeTernaryOperatorTree(
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                    (firstOperand, secondOperand, thirdOperand) =>
                        `muldiv(${firstOperand}, ${secondOperand}, ${thirdOperand})`,
                );
            }
            case FunCTerminal.ceil_muldiv.id: {
                return makeTernaryOperatorTree(
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                    (firstOperand, secondOperand, thirdOperand) =>
                        `muldivc(${firstOperand}, ${secondOperand}, ${thirdOperand})`,
                );
            }
            case FunCTerminal.round_muldiv.id: {
                return makeTernaryOperatorTree(
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                    (firstOperand, secondOperand, thirdOperand) =>
                        `muldivr(${firstOperand}, ${secondOperand}, ${thirdOperand})`,
                );
            }
            case FunCTerminal.round_mod.id: {
                return makeBinaryOperatorTree(
                    "~%",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.ceil_mod.id: {
                return makeBinaryOperatorTree(
                    "^%",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.round_shift_r.id: {
                return makeBinaryOperatorTree(
                    "~>>",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.ceil_shift_r.id: {
                return makeBinaryOperatorTree(
                    "^>>",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.comparison.id: {
                return makeBinaryOperatorTree(
                    "<=>",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            /*case FunCTerminal.and.id: {
                return makeBinaryOperatorTree(
                    "&&",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.or.id: {
                return makeBinaryOperatorTree(
                    "||",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case FunCTerminal.not.id: {
                return makeUnaryOperatorTree("!", rest, size);
            }
            case FunCTerminal.cell.id: {
                return _generateCell().map((c) => c.toString());
            }
            //case Terminal.code_of.id: {
            //    if (ctx.contractNames.length === 0) {
            //        throw new Error(
            //            "There must exist at least one contract name in generator context",
            //        );
            //    }
            //    return fc
            //        .constantFrom(...ctx.contractNames)
            //        .map((name) =>
            //            makeF.makeDummyCodeOf(makeF.makeDummyId(name)),
            //        );
            //}
            case FunCTerminal.slice.id: {
                return _generateCell().map((c) =>
                    c.toString()
                );
            }
            case FunCTerminal.address.id: {
                return _generateAddress().map((a) => a.toRawString());
            }
            case FunCTerminal.string.id: {
                return fc.string();
            }
            // case Terminal.opt_inj.id: {
            //     const currSize = size - 1;
            //     const operandNonTerminal = getNonTerminalAt(rest, 0);
            //     return genFromNonTerminal(operandNonTerminal.id, currSize);
            // }
            case FunCTerminal.null.id: {
                return fc.constant("null");
            }
            case FunCTerminal.non_null_assert.id: {
                return makeUnaryOperatorTree("!!", rest, size);
            }*/
            case FunCTerminal.cond.id: {
                return makeTernaryOperatorTree(
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                    (firstOperand, secondOperand, thirdOperand) =>
                        `${firstOperand} ? ${secondOperand} : ${thirdOperand}`,
                );
            }
            case FunCTerminal.id_int.id: {
                return makeIdentifier({ kind: "stdlib", type: StdlibType.Int });
            }
            case FunCTerminal.id_opt_int.id: {
                return makeIdentifier({
                    kind: "optional",
                    type: { kind: "stdlib", type: StdlibType.Int },
                });
            }
            case FunCTerminal.id_bool.id: {
                return makeIdentifier({
                    kind: "stdlib",
                    type: StdlibType.Bool,
                });
            }
            case FunCTerminal.id_opt_bool.id: {
                return makeIdentifier({
                    kind: "optional",
                    type: { kind: "stdlib", type: StdlibType.Bool },
                });
            }
            case FunCTerminal.id_cell.id: {
                return makeIdentifier({
                    kind: "stdlib",
                    type: StdlibType.Cell,
                });
            }
            case FunCTerminal.id_opt_cell.id: {
                return makeIdentifier({
                    kind: "optional",
                    type: { kind: "stdlib", type: StdlibType.Cell },
                });
            }
            case FunCTerminal.id_slice.id: {
                return makeIdentifier({
                    kind: "stdlib",
                    type: StdlibType.Slice,
                });
            }
            case FunCTerminal.id_opt_slice.id: {
                return makeIdentifier({
                    kind: "optional",
                    type: { kind: "stdlib", type: StdlibType.Slice },
                });
            }
            case FunCTerminal.id_address.id: {
                return makeIdentifier({
                    kind: "stdlib",
                    type: StdlibType.Address,
                });
            }
            case FunCTerminal.id_opt_address.id: {
                return makeIdentifier({
                    kind: "optional",
                    type: { kind: "stdlib", type: StdlibType.Address },
                });
            }
            case FunCTerminal.id_string.id: {
                return makeIdentifier({
                    kind: "stdlib",
                    type: StdlibType.String,
                });
            }
            case FunCTerminal.id_opt_string.id: {
                return makeIdentifier({
                    kind: "optional",
                    type: { kind: "stdlib", type: StdlibType.String },
                });
            }
        }
    }

    return genFromNonTerminal(nonTerminalId, size);
}

export function initializeGenerator(
    initConfig: GenInitConfig,
): (scope: Scope, nonTerminal: FunCNonTerminalEnum) => fc.Arbitrary<string> {
    const { productions, nonTerminals, reindexMap } =
        filterProductions(initConfig);

    const { nonTerminalCounts, sizeSplitCounts, totalCounts } =
        computeCountTables(
            initConfig.minSize,
            initConfig.maxSize,
            productions,
            nonTerminals,
        );

    return (scope: Scope, nonTerminal: FunCNonTerminalEnum) => {
        const nonTerminalId = reindexMap.get(nonTerminal.id);
        if (typeof nonTerminalId === "undefined") {
            throw new Error(
                `Non-terminal ${nonTerminal.id} does not have a re-indexing`,
            );
        }

        if (nonTerminals.every((n) => n.id !== nonTerminalId)) {
            throw new Error(
                `Non-terminal ${nonTerminalId} is not among the allowed non-terminals`,
            );
        }
        const sizes = lookupTotalCounts(totalCounts, nonTerminalId);
        if (sizes.every((s) => s === 0)) {
            throw new Error(
                `There are no trees for non-terminal ${nonTerminalId}`,
            );
        }
        const weightedSizes: fc.WeightedArbitrary<number>[] = sizes.map(
            (w, i) => {
                return { arbitrary: fc.constant(i), weight: w };
            },
        );

        return fc.oneof(...weightedSizes).chain((size) => {
            return makeExpression(
                nonTerminalId,
                scope,
                nonTerminalCounts,
                sizeSplitCounts,
                productions,
                size,
            );
        });
    };
}

function testSubwalletId(seed: string): bigint {
    return BigInt("0x" + sha256_sync("TEST_SEED" + seed).toString("hex"));
}

function _generateAddress(): fc.Arbitrary<Address> {
    return fc.string().map((str) => {
        const subwalletId = testSubwalletId(str);
        const wallet = TreasuryContract.create(0, subwalletId);
        return wallet.address;
    });
}

function _generateCell(): fc.Arbitrary<Cell> {
    return fc.int8Array().map((buf) => {
        return beginCell().storeBuffer(Buffer.from(buf.buffer)).endCell();
    });
}

export function generateIntBitLength(
    bitLength: number,
    signed: boolean,
): fc.Arbitrary<bigint> {
    const maxUnsigned = (1n << BigInt(bitLength)) - 1n;

    if (signed) {
        const minSigned = -maxUnsigned / 2n - 1n;
        const maxSigned = maxUnsigned / 2n;
        return fc.bigInt(minSigned, maxSigned);
    } else {
        return fc.bigInt(0n, maxUnsigned);
    }
}

function generateStringValue(
    nonEmpty: boolean,
    constValue?: string,
): fc.Arbitrary<string> {
    return constValue === undefined
        ? nonEmpty
            ? fc.string({ minLength: 1 })
            : fc.string()
        : fc.constantFrom(constValue);
}

export function generateString(
    nonEmpty: boolean,
    constValue?: string,
): fc.Arbitrary<Ast.String> {
    return generateStringValue(nonEmpty, constValue).map((s) =>
        FuzzContext.instance.makeF.makeDummyString(s),
    );
}

export function injectEdgeCases(
    edgeCases: EdgeCaseConfig,
    baseExpr: Ast.Expression,
    scope: Scope,
): fc.Arbitrary<Ast.Expression> {
    const makeF = FuzzContext.instance.makeF;
    switch (baseExpr.kind) {
        case "address": {
            return fc.constant(baseExpr);
        }
        case "cell": {
            return fc.constant(baseExpr);
        }
        case "slice": {
            return fc.constant(baseExpr);
        }
        case "null": {
            return fc.constant(baseExpr);
        }
        case "number": {
            const finalCases: Ast.Expression[] = [
                baseExpr,
                ...edgeCases.tryIntegerValues.map((i) =>
                    makeF.makeDummyNumber(10, i),
                ),
            ];
            if (edgeCases.generalizeIntegerToIdentifier) {
                const ty: Type = { kind: "stdlib", type: StdlibType.Int };
                const names = [
                    ...scope.getNamesRecursive("let", ty),
                    ...scope.getNamesRecursive("parameter", ty),
                ];
                finalCases.push(
                    ...names.map((name) => makeF.makeDummyId(name)),
                );
            }
            return fc.constantFrom(...finalCases);
        }
        case "boolean": {
            const finalCases: Ast.Expression[] = [
                baseExpr,
                ...edgeCases.tryBooleanValues.map((b) =>
                    makeF.makeDummyBoolean(b),
                ),
            ];
            if (edgeCases.generalizeBooleanToIdentifier) {
                const ty: Type = { kind: "stdlib", type: StdlibType.Bool };
                const names = [
                    ...scope.getNamesRecursive("let", ty),
                    ...scope.getNamesRecursive("parameter", ty),
                ];
                finalCases.push(
                    ...names.map((name) => makeF.makeDummyId(name)),
                );
            }
            return fc.constantFrom(...finalCases);
        }
        case "string": {
            const finalCases: Ast.Expression[] = [
                baseExpr,
                ...edgeCases.tryStringValues.map((s) =>
                    makeF.makeDummyString(s),
                ),
            ];
            if (edgeCases.generalizeStringToIdentifier) {
                const ty: Type = { kind: "stdlib", type: StdlibType.String };
                const names = [
                    ...scope.getNamesRecursive("let", ty),
                    ...scope.getNamesRecursive("parameter", ty),
                ];
                finalCases.push(
                    ...names.map((name) => makeF.makeDummyId(name)),
                );
            }
            return fc.constantFrom(...finalCases);
        }
        case "id": {
            const finalCases: fc.WeightedArbitrary<Ast.Expression>[] = [
                { arbitrary: fc.constant(baseExpr), weight: 10 },
            ];
            if (edgeCases.instantiateIntIds) {
                const ty: Type = { kind: "stdlib", type: StdlibType.Int };
                const names = [
                    ...scope.getNamesRecursive("let", ty),
                    ...scope.getNamesRecursive("parameter", ty),
                ];
                if (names.includes(baseExpr.text)) {
                    const weightedGens = edgeCases.tryIntegerValues.map((i) => {
                        return {
                            arbitrary: fc.constant(
                                makeF.makeDummyNumber(10, i),
                            ),
                            weight: 1,
                        };
                    });
                    finalCases.push(...weightedGens);
                    // Add a random value as well
                    finalCases.push({
                        arbitrary: generateIntBitLength(257, true).map((i) =>
                            makeF.makeDummyNumber(10, i),
                        ),
                        weight: 1,
                    });
                }
            }
            if (edgeCases.instantiateBoolIds) {
                const ty: Type = { kind: "stdlib", type: StdlibType.Bool };
                const names = [
                    ...scope.getNamesRecursive("let", ty),
                    ...scope.getNamesRecursive("parameter", ty),
                ];
                if (names.includes(baseExpr.text)) {
                    const weightedGens = edgeCases.tryBooleanValues.map((i) => {
                        return {
                            arbitrary: fc.constant(makeF.makeDummyBoolean(i)),
                            weight: 1,
                        };
                    });
                    finalCases.push(...weightedGens);
                    // Add a random value as well
                    finalCases.push({
                        arbitrary: fc
                            .boolean()
                            .map((i) => makeF.makeDummyBoolean(i)),
                        weight: 1,
                    });
                }
            }
            return fc.oneof(...finalCases);
        }
        case "code_of": {
            return fc.constant(baseExpr);
        }
        case "init_of": {
            const argsGen = baseExpr.args.map((arg) =>
                injectEdgeCases(edgeCases, arg, scope),
            );
            return fc
                .tuple(...argsGen)
                .map((args) => makeF.makeDummyInitOf(baseExpr.contract, args));
        }
        case "conditional": {
            const condGen = injectEdgeCases(
                edgeCases,
                baseExpr.condition,
                scope,
            );
            const trueBranchGen = injectEdgeCases(
                edgeCases,
                baseExpr.thenBranch,
                scope,
            );
            const falseBranchGen = injectEdgeCases(
                edgeCases,
                baseExpr.elseBranch,
                scope,
            );
            return fc
                .tuple(condGen, trueBranchGen, falseBranchGen)
                .map(([cond, trueBranch, falseBranch]) =>
                    makeF.makeDummyConditional(cond, trueBranch, falseBranch),
                );
        }
        case "field_access": {
            const aggrGen = injectEdgeCases(
                edgeCases,
                baseExpr.aggregate,
                scope,
            );
            return aggrGen.map((aggr) =>
                makeF.makeDummyFieldAccess(aggr, baseExpr.field),
            );
        }
        case "method_call": {
            const selfGen = injectEdgeCases(edgeCases, baseExpr.self, scope);
            const argsGen = packArbitraries(
                baseExpr.args.map((arg) =>
                    injectEdgeCases(edgeCases, arg, scope),
                ),
            );

            return fc.tuple(selfGen, argsGen).map(([self, args]) => {
                return makeF.makeDummyMethodCall(self, baseExpr.method, args);
            });
        }
        case "static_call": {
            const argsGen = baseExpr.args.map((arg) =>
                injectEdgeCases(edgeCases, arg, scope),
            );
            return fc
                .tuple(...argsGen)
                .map((args) =>
                    makeF.makeDummyStaticCall(baseExpr.function, args),
                );
        }
        case "op_binary": {
            const leftGen = injectEdgeCases(edgeCases, baseExpr.left, scope);
            const rightGen = injectEdgeCases(edgeCases, baseExpr.right, scope);
            return fc
                .tuple(leftGen, rightGen)
                .map(([left, right]) =>
                    makeF.makeDummyOpBinary(baseExpr.op, left, right),
                );
        }
        case "op_unary": {
            const operandGen = injectEdgeCases(
                edgeCases,
                baseExpr.operand,
                scope,
            );
            return operandGen.map((operand) =>
                makeF.makeDummyOpUnary(baseExpr.op, operand),
            );
        }
        case "struct_instance": {
            const argsGen = baseExpr.args.map((arg) =>
                injectEdgeCases(edgeCases, arg.initializer, scope).map((init) =>
                    makeF.makeDummyStructFieldInitializer(arg.field, init),
                ),
            );
            return fc
                .tuple(...argsGen)
                .map((args) =>
                    makeF.makeDummyStructInstance(baseExpr.type, args),
                );
        }
        case "struct_value": {
            // A struct value needs to be transformed into struct instance, because some of its literals may have been transformed into identifiers
            const argsGen = baseExpr.args.map((arg) =>
                injectEdgeCases(edgeCases, arg.initializer, scope).map((init) =>
                    makeF.makeDummyStructFieldInitializer(arg.field, init),
                ),
            );
            return fc
                .tuple(...argsGen)
                .map((args) =>
                    makeF.makeDummyStructInstance(baseExpr.type, args),
                );
        }
    }
}
/*
export function injectEdgeCases(edgeCases: EdgeCaseConfig, baseExpr: Ast.Expression, scope: Scope): Ast.Expression[] {
    const makeF = FuzzContext.instance.makeF;
    switch(baseExpr.kind) {
        case "address": {
            return [baseExpr];
        }
        case "cell": {
            return [baseExpr];
        }
        case "slice": {
            return [baseExpr];
        }
        case "null": {
            return [baseExpr];
        }
        case "number": {
            const finalCases: Ast.Expression[] = [baseExpr, ...edgeCases.tryIntegerValues.map(i => makeF.makeDummyNumber(10, i))];
            if (edgeCases.generalizeIntegerToIdentifier) {
                const ty: Type = {kind: "stdlib", type: StdlibType.Int};
                const names = [
                    ...scope.getNamesRecursive("let", ty),
                    ...scope.getNamesRecursive("parameter", ty)
                ];
                finalCases.push(...names.map(name => makeF.makeDummyId(name)));
            }
            return finalCases;
        }
        case "boolean": {
            const finalCases: Ast.Expression[] = [baseExpr, ...edgeCases.tryBooleanValues.map(b => makeF.makeDummyBoolean(b))];
            if (edgeCases.generalizeBooleanToIdentifier) {
                const ty: Type = {kind: "stdlib", type: StdlibType.Bool};
                const names = [
                    ...scope.getNamesRecursive("let", ty),
                    ...scope.getNamesRecursive("parameter", ty)
                ];
                finalCases.push(...names.map(name => makeF.makeDummyId(name)));
            }
            return finalCases;
        }
        case "string": {
            const finalCases: Ast.Expression[] = [baseExpr, ...edgeCases.tryStringValues.map(s => makeF.makeDummyString(s))];
            if (edgeCases.generalizeStringToIdentifier) {
                const ty: Type = {kind: "stdlib", type: StdlibType.String};
                const names = [
                    ...scope.getNamesRecursive("let", ty),
                    ...scope.getNamesRecursive("parameter", ty)
                ];
                finalCases.push(...names.map(name => makeF.makeDummyId(name)));
            }
            return finalCases;
        }
        case "id": {
            return [baseExpr];
        }
        case "code_of": {
            return [baseExpr];
        }
        case "init_of": {
            const args = baseExpr.args.map(arg => injectEdgeCases(edgeCases, arg, scope));
            const firstRow = args[0];
            if (typeof firstRow === "undefined") {
                return [baseExpr];
            }
            return cartesianProduct(firstRow, args.slice(1)).map(args => makeF.makeDummyInitOf(baseExpr.contract, args));
        }
        case "conditional": {
            const conds = injectEdgeCases(edgeCases, baseExpr.condition, scope);
            const trueBranches = injectEdgeCases(edgeCases, baseExpr.thenBranch, scope);
            const falseBranches = injectEdgeCases(edgeCases, baseExpr.elseBranch, scope);
            return cartesianProduct3(conds, trueBranches, falseBranches).map(([cond, trueBranch, falseBranch]) => 
                makeF.makeDummyConditional(cond, trueBranch, falseBranch)
            );
        }
        case "field_access": {
            const aggrs = injectEdgeCases(edgeCases, baseExpr.aggregate, scope);
            return aggrs.map(aggr => makeF.makeDummyFieldAccess(aggr, baseExpr.field));
        }
        case "method_call": {
            const selfs = injectEdgeCases(edgeCases, baseExpr.self, scope);
            const args = baseExpr.args.map(arg => injectEdgeCases(edgeCases, arg, scope));
           
            return cartesianProduct(selfs, args).map(selfAndArgs => {
                const selfPart = selfAndArgs[0];
                if (typeof selfPart === "undefined") {
                    throw new Error("self part expected");
                }
                return makeF.makeDummyMethodCall(selfPart, baseExpr.method, selfAndArgs.slice(1));
            });
        }
        case "static_call": {
            const args = baseExpr.args.map(arg => injectEdgeCases(edgeCases, arg, scope));
            const firstRow = args[0];
            if (typeof firstRow === "undefined") {
                return [baseExpr];
            }
            return cartesianProduct(firstRow, args.slice(1)).map(args => makeF.makeDummyStaticCall(baseExpr.function, args));
        }
        case "op_binary": {
            const lefts = injectEdgeCases(edgeCases, baseExpr.left, scope);
            const rights = injectEdgeCases(edgeCases, baseExpr.right, scope);
            return cartesianProduct2(lefts, rights).map(([left, right]) => 
                makeF.makeDummyOpBinary(baseExpr.op, left, right)
            );
        }
        case "op_unary": {
            const operands = injectEdgeCases(edgeCases, baseExpr.operand, scope);
            return operands.map(operand => makeF.makeDummyOpUnary(baseExpr.op, operand));
        }
        case "struct_instance": {
            throw new Error("Not supported");
        }
        case "struct_value": {
            throw new Error("Not supported");
        }
    }
}

function cartesianProduct3(f: Ast.Expression[], s: Ast.Expression[], t: Ast.Expression[]): [Ast.Expression, Ast.Expression, Ast.Expression][] {
    const result: [Ast.Expression, Ast.Expression, Ast.Expression][] = [];
    for (const e1 of f) {
        for (const e2 of s) {
            for (const e3 of t) {
                result.push([e1, e2, e3])
            }
        }
    }
    return result;
}

function cartesianProduct2(f: Ast.Expression[], s: Ast.Expression[]): [Ast.Expression, Ast.Expression][] {
    const result: [Ast.Expression, Ast.Expression][] = [];
    for (const e1 of f) {
        for (const e2 of s) {
            result.push([e1, e2])
        }
    }
    return result;
}

function cartesianProduct(first: Ast.Expression[], rest: Ast.Expression[][]): Ast.Expression[][] {
    const firstRowOfRest = rest[0];
    if (typeof firstRowOfRest === "undefined") {
        return [first];
    }
    const productOfRest = cartesianProduct(first, rest.slice(1));
    const result: Ast.Expression[][] = [];
    for (const expr of first) {
        for (const prod of productOfRest) {
            result.push([expr, ...prod]);
        }
    }
    return result;
}
*/
