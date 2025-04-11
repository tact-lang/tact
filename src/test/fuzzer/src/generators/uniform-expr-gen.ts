import type * as Ast from "@/ast/ast";
import { getAstFactory } from "@/ast/ast-helpers";
import { getMakeAst } from "@/ast/generated/make-factory";
import type { MakeAstFactory } from "@/ast/generated/make-factory";
import { statistics } from "@/test/fuzzer/test/expression-stats";
import { beginCell } from "@ton/core";
import type { Address, Cell } from "@ton/core";
import { sha256_sync } from "@ton/crypto";
import { TreasuryContract } from "@ton/sandbox";
import * as fc from "fast-check";

export const AllowedType = {
    Int: "Int",
    OptInt: "Int?",
    Bool: "Bool",
    OptBool: "Bool?",
    Cell: "Cell",
    OptCell: "Cell?",
    Slice: "Slice",
    OptSlice: "Slice?",
    Address: "Address",
    OptAddress: "Address?",
    String: "String",
    OptString: "String?",
} as const;

export type AllowedTypeEnum = (typeof AllowedType)[keyof typeof AllowedType];

export type GenContext = {
    // Identifier names to choose from, by type
    identifiers: Map<AllowedTypeEnum, string[]>;

    // Contract names to choose from
    contractNames: string[];
};

export const NonTerminal = {
    Initial: { terminal: false, literal: false, index: 0 },
    Int: { terminal: false, literal: false, index: 1 },
    OptInt: { terminal: false, literal: false, index: 2 },
    LiteralInt: { terminal: false, literal: true, index: 3 },
    LiteralOptInt: { terminal: false, literal: true, index: 4 },
    Bool: { terminal: false, literal: false, index: 5 },
    OptBool: { terminal: false, literal: false, index: 6 },
    LiteralBool: { terminal: false, literal: true, index: 7 },
    LiteralOptBool: { terminal: false, literal: true, index: 8 },
    Cell: { terminal: false, literal: false, index: 9 },
    OptCell: { terminal: false, literal: false, index: 10 },
    LiteralCell: { terminal: false, literal: true, index: 11 },
    LiteralOptCell: { terminal: false, literal: true, index: 12 },
    Slice: { terminal: false, literal: false, index: 13 },
    OptSlice: { terminal: false, literal: false, index: 14 },
    LiteralSlice: { terminal: false, literal: true, index: 15 },
    LiteralOptSlice: { terminal: false, literal: true, index: 16 },
    Address: { terminal: false, literal: false, index: 17 },
    OptAddress: { terminal: false, literal: false, index: 18 },
    LiteralAddress: { terminal: false, literal: true, index: 19 },
    LiteralOptAddress: { terminal: false, literal: true, index: 20 },
    String: { terminal: false, literal: false, index: 21 },
    OptString: { terminal: false, literal: false, index: 22 },
    LiteralString: { terminal: false, literal: true, index: 23 },
    LiteralOptString: { terminal: false, literal: true, index: 24 },
} as const;

type NonTerminalEnum = (typeof NonTerminal)[keyof typeof NonTerminal];

const Terminal = {
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
    // unary_plus: { terminal: true, id: 12 },
    unary_minus: { terminal: true, id: 12 },
    bit_not: { terminal: true, id: 13 },

    bool: { terminal: true, id: 14 },
    eq: { terminal: true, id: 15 },
    neq: { terminal: true, id: 16 },
    lt: { terminal: true, id: 17 },
    le: { terminal: true, id: 18 },
    gt: { terminal: true, id: 19 },
    ge: { terminal: true, id: 20 },
    and: { terminal: true, id: 21 },
    or: { terminal: true, id: 22 },
    not: { terminal: true, id: 23 },

    cell: { terminal: true, id: 24 },
    code_of: { terminal: true, id: 25 },

    slice: { terminal: true, id: 26 },

    address: { terminal: true, id: 27 },

    string: { terminal: true, id: 28 },

    opt_inj: { terminal: true, id: 29 },
    null: { terminal: true, id: 30 },
    non_null_assert: { terminal: true, id: 31 },

    cond: { terminal: true, id: 32 },

    id_int: { terminal: true, id: 33 },
    id_opt_int: { terminal: true, id: 34 },
    id_bool: { terminal: true, id: 35 },
    id_opt_bool: { terminal: true, id: 36 },
    id_cell: { terminal: true, id: 37 },
    id_opt_cell: { terminal: true, id: 38 },
    id_slice: { terminal: true, id: 39 },
    id_opt_slice: { terminal: true, id: 40 },
    id_address: { terminal: true, id: 41 },
    id_opt_address: { terminal: true, id: 42 },
    id_string: { terminal: true, id: 43 },
    id_opt_string: { terminal: true, id: 44 },
} as const;

type TerminalEnum = (typeof Terminal)[keyof typeof Terminal];

type Token = TerminalEnum | NonTerminalEnum;

type ExprProduction = {
    tokens: Token[];
    index: number;
};

const productions: ExprProduction[][] = [
    [
        // Productions for Initial
        { index: 0, tokens: [NonTerminal.Int] },
        { index: 1, tokens: [NonTerminal.OptInt] },
        { index: 2, tokens: [NonTerminal.LiteralInt] },
        { index: 3, tokens: [NonTerminal.LiteralOptInt] },
        { index: 4, tokens: [NonTerminal.Bool] },
        { index: 5, tokens: [NonTerminal.OptBool] },
        { index: 6, tokens: [NonTerminal.LiteralBool] },
        { index: 7, tokens: [NonTerminal.LiteralOptBool] },
        { index: 8, tokens: [NonTerminal.Cell] },
        { index: 9, tokens: [NonTerminal.OptCell] },
        { index: 10, tokens: [NonTerminal.LiteralCell] },
        { index: 11, tokens: [NonTerminal.LiteralOptCell] },
        { index: 12, tokens: [NonTerminal.Slice] },
        { index: 13, tokens: [NonTerminal.OptSlice] },
        { index: 14, tokens: [NonTerminal.LiteralSlice] },
        { index: 15, tokens: [NonTerminal.LiteralOptSlice] },
        { index: 16, tokens: [NonTerminal.Address] },
        { index: 17, tokens: [NonTerminal.OptAddress] },
        { index: 18, tokens: [NonTerminal.LiteralAddress] },
        { index: 19, tokens: [NonTerminal.LiteralOptAddress] },
        { index: 20, tokens: [NonTerminal.String] },
        { index: 21, tokens: [NonTerminal.LiteralString] },
        { index: 22, tokens: [NonTerminal.OptString] },
        { index: 23, tokens: [NonTerminal.LiteralOptString] },
    ],
    [
        // Productions for Int
        { index: 0, tokens: [Terminal.add, NonTerminal.Int, NonTerminal.Int] },
        {
            index: 1,
            tokens: [Terminal.minus, NonTerminal.Int, NonTerminal.Int],
        },
        { index: 2, tokens: [Terminal.mult, NonTerminal.Int, NonTerminal.Int] },
        { index: 3, tokens: [Terminal.div, NonTerminal.Int, NonTerminal.Int] },
        { index: 4, tokens: [Terminal.mod, NonTerminal.Int, NonTerminal.Int] },
        {
            index: 5,
            tokens: [Terminal.shift_r, NonTerminal.Int, NonTerminal.Int],
        },
        {
            index: 6,
            tokens: [Terminal.shift_l, NonTerminal.Int, NonTerminal.Int],
        },
        {
            index: 7,
            tokens: [Terminal.bit_and, NonTerminal.Int, NonTerminal.Int],
        },
        {
            index: 8,
            tokens: [Terminal.bit_or, NonTerminal.Int, NonTerminal.Int],
        },
        {
            index: 9,
            tokens: [Terminal.bit_xor, NonTerminal.Int, NonTerminal.Int],
        },
        // { index: 10, tokens: [Terminal.unary_plus, NonTerminal.Int] },
        { index: 10, tokens: [Terminal.unary_minus, NonTerminal.Int] },
        { index: 11, tokens: [Terminal.bit_not, NonTerminal.Int] },

        { index: 12, tokens: [Terminal.non_null_assert, NonTerminal.OptInt] },
        {
            index: 13,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.Int,
                NonTerminal.Int,
            ],
        },
        { index: 14, tokens: [Terminal.id_int] },
        { index: 15, tokens: [NonTerminal.LiteralInt] },
    ],
    [
        // Productions for OptInt
        { index: 0, tokens: [Terminal.opt_inj, NonTerminal.Int] },
        {
            index: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.OptInt,
                NonTerminal.OptInt,
            ],
        },
        { index: 2, tokens: [Terminal.id_opt_int] },
        { index: 3, tokens: [NonTerminal.LiteralOptInt] },
    ],
    [
        // Productions for LiteralInt
        { index: 0, tokens: [Terminal.integer] },
    ],
    [
        // Productions for LiteralOptInt
        { index: 0, tokens: [Terminal.null] },
        { index: 1, tokens: [Terminal.opt_inj, NonTerminal.LiteralInt] },
    ],
    [
        // Productions for Bool
        { index: 0, tokens: [Terminal.eq, NonTerminal.Int, NonTerminal.Int] },
        {
            index: 1,
            tokens: [Terminal.eq, NonTerminal.OptInt, NonTerminal.OptInt],
        },
        { index: 2, tokens: [Terminal.eq, NonTerminal.Bool, NonTerminal.Bool] },
        {
            index: 3,
            tokens: [Terminal.eq, NonTerminal.OptBool, NonTerminal.OptBool],
        },
        {
            index: 4,
            tokens: [Terminal.eq, NonTerminal.Address, NonTerminal.Address],
        },
        {
            index: 5,
            tokens: [
                Terminal.eq,
                NonTerminal.OptAddress,
                NonTerminal.OptAddress,
            ],
        },
        { index: 6, tokens: [Terminal.eq, NonTerminal.Cell, NonTerminal.Cell] },
        {
            index: 7,
            tokens: [Terminal.eq, NonTerminal.OptCell, NonTerminal.OptCell],
        },
        {
            index: 8,
            tokens: [Terminal.eq, NonTerminal.Slice, NonTerminal.Slice],
        },
        {
            index: 9,
            tokens: [Terminal.eq, NonTerminal.OptSlice, NonTerminal.OptSlice],
        },
        {
            index: 10,
            tokens: [Terminal.eq, NonTerminal.String, NonTerminal.String],
        },
        {
            index: 11,
            tokens: [Terminal.eq, NonTerminal.OptString, NonTerminal.OptString],
        },

        { index: 12, tokens: [Terminal.neq, NonTerminal.Int, NonTerminal.Int] },
        {
            index: 13,
            tokens: [Terminal.neq, NonTerminal.OptInt, NonTerminal.OptInt],
        },
        {
            index: 14,
            tokens: [Terminal.neq, NonTerminal.Bool, NonTerminal.Bool],
        },
        {
            index: 15,
            tokens: [Terminal.neq, NonTerminal.OptBool, NonTerminal.OptBool],
        },
        {
            index: 16,
            tokens: [Terminal.neq, NonTerminal.Address, NonTerminal.Address],
        },
        {
            index: 17,
            tokens: [
                Terminal.neq,
                NonTerminal.OptAddress,
                NonTerminal.OptAddress,
            ],
        },
        {
            index: 18,
            tokens: [Terminal.neq, NonTerminal.Cell, NonTerminal.Cell],
        },
        {
            index: 19,
            tokens: [Terminal.neq, NonTerminal.OptCell, NonTerminal.OptCell],
        },
        {
            index: 20,
            tokens: [Terminal.neq, NonTerminal.Slice, NonTerminal.Slice],
        },
        {
            index: 21,
            tokens: [Terminal.neq, NonTerminal.OptSlice, NonTerminal.OptSlice],
        },
        {
            index: 22,
            tokens: [Terminal.neq, NonTerminal.String, NonTerminal.String],
        },
        {
            index: 23,
            tokens: [
                Terminal.neq,
                NonTerminal.OptString,
                NonTerminal.OptString,
            ],
        },

        { index: 24, tokens: [Terminal.lt, NonTerminal.Int, NonTerminal.Int] },
        { index: 25, tokens: [Terminal.le, NonTerminal.Int, NonTerminal.Int] },
        { index: 26, tokens: [Terminal.gt, NonTerminal.Int, NonTerminal.Int] },
        { index: 27, tokens: [Terminal.ge, NonTerminal.Int, NonTerminal.Int] },
        {
            index: 28,
            tokens: [Terminal.and, NonTerminal.Bool, NonTerminal.Bool],
        },
        {
            index: 29,
            tokens: [Terminal.or, NonTerminal.Bool, NonTerminal.Bool],
        },
        { index: 30, tokens: [Terminal.not, NonTerminal.Bool] },

        { index: 31, tokens: [Terminal.non_null_assert, NonTerminal.OptBool] },
        {
            index: 32,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.Bool,
                NonTerminal.Bool,
            ],
        },
        { index: 33, tokens: [Terminal.id_bool] },
        { index: 34, tokens: [NonTerminal.LiteralBool] },
    ],
    [
        // Productions for OptBool
        { index: 0, tokens: [Terminal.opt_inj, NonTerminal.Bool] },
        {
            index: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.OptBool,
                NonTerminal.OptBool,
            ],
        },
        { index: 2, tokens: [Terminal.id_opt_bool] },
        { index: 3, tokens: [NonTerminal.LiteralOptBool] },
    ],
    [
        // Productions for LiteralBool
        { index: 0, tokens: [Terminal.bool] },
    ],
    [
        // Productions for LiteralOptBool
        { index: 0, tokens: [Terminal.null] },
        { index: 1, tokens: [Terminal.opt_inj, NonTerminal.LiteralBool] },
    ],
    [
        // Productions for Cell
        { index: 0, tokens: [Terminal.code_of] },

        { index: 1, tokens: [Terminal.non_null_assert, NonTerminal.OptCell] },
        {
            index: 2,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.Cell,
                NonTerminal.Cell,
            ],
        },
        { index: 3, tokens: [Terminal.id_cell] },
        { index: 4, tokens: [NonTerminal.LiteralCell] },
    ],
    [
        // Productions for OptCell
        { index: 0, tokens: [Terminal.opt_inj, NonTerminal.Cell] },
        {
            index: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.OptCell,
                NonTerminal.OptCell,
            ],
        },
        { index: 2, tokens: [Terminal.id_opt_cell] },
        { index: 3, tokens: [NonTerminal.LiteralOptCell] },
    ],
    [
        // Productions for LiteralCell
        { index: 0, tokens: [Terminal.cell] },
    ],
    [
        // Productions for LiteralOptCell
        { index: 0, tokens: [Terminal.null] },
        { index: 1, tokens: [Terminal.opt_inj, NonTerminal.LiteralCell] },
    ],
    [
        // Productions for Slice
        { index: 0, tokens: [Terminal.non_null_assert, NonTerminal.OptSlice] },
        {
            index: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.Slice,
                NonTerminal.Slice,
            ],
        },
        { index: 2, tokens: [Terminal.id_slice] },
        { index: 3, tokens: [NonTerminal.LiteralSlice] },
    ],
    [
        // Productions for OptSlice
        { index: 0, tokens: [Terminal.opt_inj, NonTerminal.Slice] },
        {
            index: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.OptSlice,
                NonTerminal.OptSlice,
            ],
        },
        { index: 2, tokens: [Terminal.id_opt_slice] },
        { index: 3, tokens: [NonTerminal.LiteralOptSlice] },
    ],
    [
        // Productions for LiteralSlice
        { index: 0, tokens: [Terminal.slice] },
    ],
    [
        // Productions for LiteralOptSlice
        { index: 0, tokens: [Terminal.null] },
        { index: 1, tokens: [Terminal.opt_inj, NonTerminal.LiteralSlice] },
    ],
    [
        // Productions for Address
        {
            index: 0,
            tokens: [Terminal.non_null_assert, NonTerminal.OptAddress],
        },
        {
            index: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.Address,
                NonTerminal.Address,
            ],
        },
        { index: 2, tokens: [Terminal.id_address] },
        { index: 3, tokens: [NonTerminal.LiteralAddress] },
    ],
    [
        // Productions for OptAddress
        { index: 0, tokens: [Terminal.opt_inj, NonTerminal.Address] },
        {
            index: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.OptAddress,
                NonTerminal.OptAddress,
            ],
        },
        { index: 2, tokens: [Terminal.id_opt_address] },
        { index: 3, tokens: [NonTerminal.LiteralOptAddress] },
    ],
    [
        // Productions for LiteralAddress
        { index: 0, tokens: [Terminal.address] },
    ],
    [
        // Productions for LiteralOptAddress
        { index: 0, tokens: [Terminal.null] },
        { index: 1, tokens: [Terminal.opt_inj, NonTerminal.LiteralAddress] },
    ],
    [
        // Productions for String
        { index: 0, tokens: [Terminal.non_null_assert, NonTerminal.OptString] },
        {
            index: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.String,
                NonTerminal.String,
            ],
        },
        { index: 2, tokens: [Terminal.id_string] },
        { index: 3, tokens: [NonTerminal.LiteralString] },
    ],
    [
        // Productions for OptString
        { index: 0, tokens: [Terminal.opt_inj, NonTerminal.String] },
        {
            index: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.OptString,
                NonTerminal.OptString,
            ],
        },
        { index: 2, tokens: [Terminal.id_opt_string] },
        { index: 3, tokens: [NonTerminal.LiteralOptString] },
    ],
    [
        // Productions for LiteralString
        { index: 0, tokens: [Terminal.string] },
    ],
    [
        // Productions for LiteralOptString
        { index: 0, tokens: [Terminal.null] },
        { index: 1, tokens: [Terminal.opt_inj, NonTerminal.LiteralString] },
    ],
];

function sum(counts: number[]): number {
    return counts.reduce((prev, curr) => prev + curr, 0);
}

function computeCountTables(
    minSize: number,
    maxSize: number,
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
        const prods = getProductions(nonTerminalIndex);
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

    function countFromNonTerminal(index: number, size: number): number[] {
        const peekedCounts = peekNonTerminalCounts(index, size);
        if (typeof peekedCounts !== "undefined") {
            return peekedCounts;
        }
        const prods = getProductions(index);
        return prods.map((prod) =>
            sum(countFromProduction(index, prod, 0, size)),
        );
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
            production.index,
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
                return size === 1 ? [1] : [0];
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
            return [sum(countFromNonTerminal(head.index, size))];
        } else {
            const result: number[] = [];

            for (
                let l = 1;
                l <= size - production.tokens.length + tokenIndex + 1;
                l++
            ) {
                const partition1 = sum(countFromNonTerminal(head.index, l));
                const partition2 = sum(
                    countFromProduction(
                        nonTerminalIndex,
                        production,
                        tokenIndex + 1,
                        size - l,
                    ),
                );
                result.push(partition1 * partition2);
            }
            return result;
        }
    }

    function doCountsForNonTerminals(nonTerminals: NonTerminalEnum[]) {
        // First, compute the counts of all the non-terminals that produce literals

        // The first step is to initialize the tables for size 0
        for (const nonTerminal of nonTerminals) {
            const nonTerminalIdx = nonTerminal.index;

            const productions = getProductions(nonTerminalIdx);

            updateNonTerminalCounts(
                nonTerminalIdx,
                0,
                productions.map((_) => 0),
            );

            for (const prod of productions) {
                for (
                    let tokenIndx = 0;
                    tokenIndx < prod.tokens.length;
                    tokenIndx++
                ) {
                    updateSizeSplitCounts(
                        nonTerminalIdx,
                        prod.index,
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
                const nonTerminalIdx = nonTerminal.index;

                const productions = getProductions(nonTerminalIdx);

                for (const prod of productions) {
                    for (
                        let tokenIndx = 0;
                        tokenIndx < prod.tokens.length;
                        tokenIndx++
                    ) {
                        updateSizeSplitCounts(
                            nonTerminalIdx,
                            prod.index,
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
        for (let size = 0; size < minSize; size++) {
            for (const nonTerminal of Object.values(NonTerminal)) {
                updateTotalCounts(nonTerminal.index, size, 0);
            }
        }

        for (let size = minSize; size <= maxSize; size++) {
            for (const nonTerminal of Object.values(NonTerminal)) {
                updateTotalCounts(
                    nonTerminal.index,
                    size,
                    sum(
                        lookupNonTerminalCounts(
                            nonTerminalCounts,
                            nonTerminal.index,
                            size,
                        ),
                    ),
                );
            }
        }
    }

    function accumulateArray(counts: number[]): number[] {
        if (counts.length === 0) {
            return counts;
        }
        const result: number[] = [counts[0]!];
        for (let i = 1; i < counts.length; i++) {
            result[i] = counts[i]! + result[i - 1]!;
        }
        return result;
    }

    function accumulateCounts() {
        // The total counts
        for (const nonTerminal of Object.values(NonTerminal)) {
            const counts = totalCounts[nonTerminal.index];
            if (typeof counts === "undefined") {
                throw new Error(`Index ${nonTerminal.index} out of bounds`);
            }
            const newCounts = accumulateArray(counts);
            totalCounts[nonTerminal.index] = newCounts;
        }

        // The non-terminal counts
        for (const nonTerminal of Object.values(NonTerminal)) {
            for (let size = 0; size <= maxSize; size++) {
                const counts = lookupNonTerminalCounts(
                    nonTerminalCounts,
                    nonTerminal.index,
                    size,
                );
                const newCounts = accumulateArray(counts);
                updateNonTerminalCounts(nonTerminal.index, size, newCounts);
            }
        }

        // Split size counts
        for (const nonTerminal of Object.values(NonTerminal)) {
            const nonTerminalIdx = nonTerminal.index;

            const productions = getProductions(nonTerminalIdx);

            for (const prod of productions) {
                for (
                    let tokenIndx = 0;
                    tokenIndx < prod.tokens.length;
                    tokenIndx++
                ) {
                    for (let size = 0; size <= maxSize; size++) {
                        const counts = lookupSizeSplitCounts(
                            sizeSplitCounts,
                            nonTerminal.index,
                            prod.index,
                            tokenIndx,
                            size,
                        );
                        const newCounts = accumulateArray(counts);
                        updateSizeSplitCounts(
                            nonTerminal.index,
                            prod.index,
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
        Object.values(NonTerminal).filter((nonTerminal) => nonTerminal.literal),
    );

    // Now the rest of non-terminals, but not the initial non-terminal
    doCountsForNonTerminals(
        Object.values(NonTerminal).filter(
            (nonTerminal) => !nonTerminal.literal && nonTerminal.index !== 0,
        ),
    );

    // Finally, the initial non-terminal
    doCountsForNonTerminals([NonTerminal.Initial]);

    doTotalCounts();

    accumulateCounts();

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

function getProductions(idx: number): ExprProduction[] {
    const prods = productions[idx];
    if (typeof prods === "undefined") {
        throw new Error(`${idx} is not a valid index for a non-terminal`);
    }
    return prods;
}

function getTokenAt(tokens: Token[], index: number): Token {
    const token = tokens[index];
    if (typeof token === "undefined") {
        throw new Error(`Index ${index} is out of bounds`);
    }
    return token;
}

function getNonTerminalAt(tokens: Token[], index: number): NonTerminalEnum {
    const token = getTokenAt(tokens, index);
    if (token.terminal) {
        throw new Error(`Was expecting a non-terminal`);
    }
    return token;
}

function getProductionAt(
    prods: ExprProduction[],
    index: number,
): ExprProduction {
    const prod = prods[index];
    if (typeof prod === "undefined") {
        throw new Error(`Index ${index} out of bounds in productions array`);
    }
    return prod;
}

function makeExpression(
    makeF: MakeAstFactory,
    type: NonTerminalEnum,
    ctx: GenContext,
    nonTerminalCounts: number[][][],
    sizeSplitCounts: number[][][][][],
    size: number,
): Ast.Expression {
    function genFromNonTerminal(index: number, size: number): Ast.Expression {
        const prods = getProductions(index);
        const nonTerminalOptions = lookupNonTerminalCounts(
            nonTerminalCounts,
            index,
            size,
        );

        const chosenProdIndex = randomlyChooseIndex(nonTerminalOptions);
        const production = getProductionAt(prods, chosenProdIndex);
        return genFromProduction(index, production, size);
    }

    function genFromProduction(
        nonTerminalIndex: number,
        production: ExprProduction,
        size: number,
    ): Ast.Expression {
        const head = getTokenAt(production.tokens, 0);
        if (head.terminal) {
            // The production must have the form: N -> head list_of_non_terminals
            // where head indicates the kind of tree we need to produce
            return makeTree(
                nonTerminalIndex,
                production.index,
                head,
                production.tokens.slice(1),
                size,
            );
        }
        // head is not a terminal
        // The production must have the form N -> head
        return genFromNonTerminal(head.index, size);
    }

    function chooseSizeSplit(
        nonTerminalIndex: number,
        prodIndex: number,
        tokenIndex: number,
        size: number,
    ): number {
        const sizeSplits = lookupSizeSplitCounts(
            sizeSplitCounts,
            nonTerminalIndex,
            prodIndex,
            tokenIndex,
            size,
        );
        return randomlyChooseIndex(sizeSplits) + 1;
    }

    function makeBinaryOperatorTree(
        op: Ast.BinaryOperation,
        nonTerminalIndex: number,
        prodIndex: number,
        rest: Token[],
        size: number,
    ): Ast.Expression {
        const currSize = size - 1;
        // Choose a single split for the size
        const sizeSplit = chooseSizeSplit(
            nonTerminalIndex,
            prodIndex,
            1,
            currSize,
        );

        const leftNonTerminal = getNonTerminalAt(rest, 0);
        const rightNonTerminal = getNonTerminalAt(rest, 1);
        const leftOperand = genFromNonTerminal(
            leftNonTerminal.index,
            sizeSplit,
        );
        const rightOperand = genFromNonTerminal(
            rightNonTerminal.index,
            currSize - sizeSplit,
        );
        return makeF.makeDummyOpBinary(op, leftOperand, rightOperand);
    }

    function makeUnaryOperatorTree(
        op: Ast.UnaryOperation,
        rest: Token[],
        size: number,
    ): Ast.Expression {
        const currSize = size - 1;

        const operandNonTerminal = getNonTerminalAt(rest, 0);
        const operand = genFromNonTerminal(operandNonTerminal.index, currSize);
        return makeF.makeDummyOpUnary(op, operand);
    }

    function makeIdentifier(t: AllowedTypeEnum): Ast.Expression {
        const names = ctx.identifiers.get(t);
        if (typeof names === "undefined" || names.length === 0) {
            throw new Error(
                `There must exist at least one identifier for type ${t}`,
            );
        }
        return makeF.makeDummyId(fc.sample(fc.constantFrom(...names))[0]!);
    }

    function makeTree(
        nonTerminalIndex: number,
        prodIndex: number,
        head: TerminalEnum,
        rest: Token[],
        size: number,
    ): Ast.Expression {
        switch (head.id) {
            case Terminal.integer.id: {
                return fc.sample(
                    fc.bigInt().map((i) => makeF.makeDummyNumber(10, i)),
                    1,
                )[0]!;
            }
            case Terminal.add.id: {
                return makeBinaryOperatorTree(
                    "+",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.minus.id: {
                return makeBinaryOperatorTree(
                    "-",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.mult.id: {
                return makeBinaryOperatorTree(
                    "*",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.div.id: {
                return makeBinaryOperatorTree(
                    "/",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.mod.id: {
                return makeBinaryOperatorTree(
                    "%",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.shift_r.id: {
                return makeBinaryOperatorTree(
                    ">>",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.shift_l.id: {
                return makeBinaryOperatorTree(
                    "<<",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.bit_and.id: {
                return makeBinaryOperatorTree(
                    "&",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.bit_or.id: {
                return makeBinaryOperatorTree(
                    "|",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.bit_xor.id: {
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
            case Terminal.unary_minus.id: {
                return makeUnaryOperatorTree("-", rest, size);
            }
            case Terminal.bit_not.id: {
                return makeUnaryOperatorTree("~", rest, size);
            }
            case Terminal.bool.id: {
                return fc.sample(
                    fc.boolean().map((b) => makeF.makeDummyBoolean(b)),
                    1,
                )[0]!;
            }
            case Terminal.eq.id: {
                return makeBinaryOperatorTree(
                    "==",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.neq.id: {
                return makeBinaryOperatorTree(
                    "!=",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.lt.id: {
                return makeBinaryOperatorTree(
                    "<",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.le.id: {
                return makeBinaryOperatorTree(
                    "<=",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.gt.id: {
                return makeBinaryOperatorTree(
                    ">",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.ge.id: {
                return makeBinaryOperatorTree(
                    ">=",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.and.id: {
                return makeBinaryOperatorTree(
                    "&&",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.or.id: {
                return makeBinaryOperatorTree(
                    "||",
                    nonTerminalIndex,
                    prodIndex,
                    rest,
                    size,
                );
            }
            case Terminal.not.id: {
                return makeUnaryOperatorTree("!", rest, size);
            }
            case Terminal.cell.id: {
                return makeF.makeDummyCell(fc.sample(_generateCell(), 1)[0]!);
            }
            case Terminal.code_of.id: {
                if (ctx.contractNames.length === 0) {
                    throw new Error(
                        "There must exist at least one contract name in generator context",
                    );
                }
                return makeF.makeDummyCodeOf(
                    makeF.makeDummyId(
                        fc.sample(fc.constantFrom(...ctx.contractNames), 1)[0]!,
                    ),
                );
            }
            case Terminal.slice.id: {
                return makeF.makeDummySlice(
                    fc.sample(_generateCell(), 1)[0]!.asSlice(),
                );
            }
            case Terminal.address.id: {
                return makeF.makeDummyAddress(
                    fc.sample(_generateAddress(), 1)[0]!,
                );
            }
            case Terminal.string.id: {
                return makeF.makeDummyString(fc.sample(fc.string(), 1)[0]!);
            }
            case Terminal.opt_inj.id: {
                const currSize = size - 1;
                const operandNonTerminal = getNonTerminalAt(rest, 0);
                return genFromNonTerminal(operandNonTerminal.index, currSize);
            }
            case Terminal.null.id: {
                return makeF.makeDummyNull();
            }
            case Terminal.non_null_assert.id: {
                return makeUnaryOperatorTree("!!", rest, size);
            }
            case Terminal.cond.id: {
                const currSize = size - 1;
                // Choose two splits for the size
                const sizeSplit1 = chooseSizeSplit(
                    nonTerminalIndex,
                    prodIndex,
                    1,
                    currSize,
                );
                const sizeSplit2 = chooseSizeSplit(
                    nonTerminalIndex,
                    prodIndex,
                    2,
                    currSize - sizeSplit1,
                );

                const condNonTerminal = getNonTerminalAt(rest, 0);
                const thenNonTerminal = getNonTerminalAt(rest, 1);
                const elseNonTerminal = getNonTerminalAt(rest, 2);
                const condOperand = genFromNonTerminal(
                    condNonTerminal.index,
                    sizeSplit1,
                );
                const thenOperand = genFromNonTerminal(
                    thenNonTerminal.index,
                    sizeSplit2,
                );
                const elseOperand = genFromNonTerminal(
                    elseNonTerminal.index,
                    currSize - sizeSplit1 - sizeSplit2,
                );
                return makeF.makeDummyConditional(
                    condOperand,
                    thenOperand,
                    elseOperand,
                );
            }
            case Terminal.id_int.id: {
                return makeIdentifier("Int");
            }
            case Terminal.id_opt_int.id: {
                return makeIdentifier("Int?");
            }
            case Terminal.id_bool.id: {
                return makeIdentifier("Bool");
            }
            case Terminal.id_opt_bool.id: {
                return makeIdentifier("Bool?");
            }
            case Terminal.id_cell.id: {
                return makeIdentifier("Cell");
            }
            case Terminal.id_opt_cell.id: {
                return makeIdentifier("Cell?");
            }
            case Terminal.id_slice.id: {
                return makeIdentifier("Slice");
            }
            case Terminal.id_opt_slice.id: {
                return makeIdentifier("Slice?");
            }
            case Terminal.id_address.id: {
                return makeIdentifier("Address");
            }
            case Terminal.id_opt_address.id: {
                return makeIdentifier("Address?");
            }
            case Terminal.id_string.id: {
                return makeIdentifier("String");
            }
            case Terminal.id_opt_string.id: {
                return makeIdentifier("String?");
            }
        }
    }

    return genFromNonTerminal(type.index, size);
}

export function initializeGenerator(
    minSize: number,
    maxSize: number,
    ctx: GenContext,
): (type: NonTerminalEnum) => fc.Arbitrary<Ast.Expression> {
    const { nonTerminalCounts, sizeSplitCounts, totalCounts } =
        computeCountTables(minSize, maxSize);
    const makeF = getMakeAst(getAstFactory());

    return (type: NonTerminalEnum) => {
        const sizes = lookupTotalCounts(totalCounts, type.index);
        return fc.constant(0).map((_) => {
            const size = randomlyChooseIndex(sizes);
            return makeExpression(
                makeF,
                type,
                ctx,
                nonTerminalCounts,
                sizeSplitCounts,
                size,
            );
        });
    };
}

function randomlyChooseIndex(array: number[]): number {
    const random = Math.random() * array[array.length - 1]!;
    for (let i = 0; i < array.length; i++) {
        if (array[i]! > random) {
            return i;
        }
    }
    throw new Error("There must exist at least one element in the array");
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

// Uncomment this to show the bug in fast-check
//console.log(genFromNonTerminal(0,66));

//statistics(heightGenerator(10), false);

// Create a GenContext with allowed identifiers and contracts
const ids: Map<AllowedTypeEnum, string[]> = new Map();
ids.set(AllowedType.Int, ["intV1", "intV2", "intV3"]);
ids.set(AllowedType.OptInt, ["o_intV1", "o_intV2", "o_intV3"]);
ids.set(AllowedType.Bool, ["boolV1", "boolV2", "boolV3"]);
ids.set(AllowedType.OptBool, ["o_boolV1", "o_boolV2", "o_boolV3"]);
ids.set(AllowedType.Cell, ["cellV1", "cellV2", "cellV3"]);
ids.set(AllowedType.OptCell, ["o_cellV1", "o_cellV2", "o_cellV3"]);
ids.set(AllowedType.Slice, ["sliceV1", "sliceV2", "sliceV3"]);
ids.set(AllowedType.OptSlice, ["o_sliceV1", "o_sliceV2", "o_sliceV3"]);
ids.set(AllowedType.Address, ["addressV1", "addressV2", "addressV3"]);
ids.set(AllowedType.OptAddress, ["o_addressV1", "o_addressV2", "o_addressV3"]);
ids.set(AllowedType.String, ["stringV1", "stringV2", "stringV3"]);
ids.set(AllowedType.OptString, ["o_stringV1", "o_stringV2", "o_stringV3"]);

const ctx: GenContext = {
    identifiers: ids,
    contractNames: ["C1", "C2"],
};

const initialized = initializeGenerator(4, 5, ctx);

statistics(initialized(NonTerminal.Int), 100, "stats.txt");
