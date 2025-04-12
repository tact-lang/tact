import type * as Ast from "@/ast/ast";
import type { FactoryAst } from "@/ast/ast-helpers";
import { getMakeAst } from "@/ast/generated/make-factory";
import { getAstUtil } from "@/ast/util";
import { Interpreter } from "@/optimizer/interpreter";
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
    Initial: { terminal: false, literal: false, id: 0 },
    Int: { terminal: false, literal: false, id: 1 },
    OptInt: { terminal: false, literal: false, id: 2 },
    LiteralInt: { terminal: false, literal: true, id: 3 },
    LiteralOptInt: { terminal: false, literal: true, id: 4 },
    Bool: { terminal: false, literal: false, id: 5 },
    OptBool: { terminal: false, literal: false, id: 6 },
    LiteralBool: { terminal: false, literal: true, id: 7 },
    LiteralOptBool: { terminal: false, literal: true, id: 8 },
    Cell: { terminal: false, literal: false, id: 9 },
    OptCell: { terminal: false, literal: false, id: 10 },
    LiteralCell: { terminal: false, literal: true, id: 11 },
    LiteralOptCell: { terminal: false, literal: true, id: 12 },
    Slice: { terminal: false, literal: false, id: 13 },
    OptSlice: { terminal: false, literal: false, id: 14 },
    LiteralSlice: { terminal: false, literal: true, id: 15 },
    LiteralOptSlice: { terminal: false, literal: true, id: 16 },
    Address: { terminal: false, literal: false, id: 17 },
    OptAddress: { terminal: false, literal: false, id: 18 },
    LiteralAddress: { terminal: false, literal: true, id: 19 },
    LiteralOptAddress: { terminal: false, literal: true, id: 20 },
    String: { terminal: false, literal: false, id: 21 },
    OptString: { terminal: false, literal: false, id: 22 },
    LiteralString: { terminal: false, literal: true, id: 23 },
    LiteralOptString: { terminal: false, literal: true, id: 24 },
} as const;

export type NonTerminalEnum = (typeof NonTerminal)[keyof typeof NonTerminal];

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
    // null: { terminal: true, id: 30 },
    non_null_assert: { terminal: true, id: 30 },

    cond: { terminal: true, id: 31 },

    id_int: { terminal: true, id: 32 },
    id_opt_int: { terminal: true, id: 33 },
    id_bool: { terminal: true, id: 34 },
    id_opt_bool: { terminal: true, id: 35 },
    id_cell: { terminal: true, id: 36 },
    id_opt_cell: { terminal: true, id: 37 },
    id_slice: { terminal: true, id: 38 },
    id_opt_slice: { terminal: true, id: 39 },
    id_address: { terminal: true, id: 40 },
    id_opt_address: { terminal: true, id: 41 },
    id_string: { terminal: true, id: 42 },
    id_opt_string: { terminal: true, id: 43 },
} as const;

type TerminalEnum = (typeof Terminal)[keyof typeof Terminal];

type Token = TerminalEnum | NonTerminalEnum;

type ExprProduction = {
    tokens: Token[];
    id: number;
};

const allProductions: ExprProduction[][] = [
    [
        // Productions for Initial
        { id: 0, tokens: [NonTerminal.Int] },
        { id: 1, tokens: [NonTerminal.OptInt] },
        { id: 2, tokens: [NonTerminal.LiteralInt] },
        { id: 3, tokens: [NonTerminal.LiteralOptInt] },
        { id: 4, tokens: [NonTerminal.Bool] },
        { id: 5, tokens: [NonTerminal.OptBool] },
        { id: 6, tokens: [NonTerminal.LiteralBool] },
        { id: 7, tokens: [NonTerminal.LiteralOptBool] },
        { id: 8, tokens: [NonTerminal.Cell] },
        { id: 9, tokens: [NonTerminal.OptCell] },
        { id: 10, tokens: [NonTerminal.LiteralCell] },
        { id: 11, tokens: [NonTerminal.LiteralOptCell] },
        { id: 12, tokens: [NonTerminal.Slice] },
        { id: 13, tokens: [NonTerminal.OptSlice] },
        { id: 14, tokens: [NonTerminal.LiteralSlice] },
        { id: 15, tokens: [NonTerminal.LiteralOptSlice] },
        { id: 16, tokens: [NonTerminal.Address] },
        { id: 17, tokens: [NonTerminal.OptAddress] },
        { id: 18, tokens: [NonTerminal.LiteralAddress] },
        { id: 19, tokens: [NonTerminal.LiteralOptAddress] },
        { id: 20, tokens: [NonTerminal.String] },
        { id: 21, tokens: [NonTerminal.LiteralString] },
        { id: 22, tokens: [NonTerminal.OptString] },
        { id: 23, tokens: [NonTerminal.LiteralOptString] },
    ],
    [
        // Productions for Int
        { id: 0, tokens: [Terminal.add, NonTerminal.Int, NonTerminal.Int] },
        {
            id: 1,
            tokens: [Terminal.minus, NonTerminal.Int, NonTerminal.Int],
        },
        { id: 2, tokens: [Terminal.mult, NonTerminal.Int, NonTerminal.Int] },
        { id: 3, tokens: [Terminal.div, NonTerminal.Int, NonTerminal.Int] },
        { id: 4, tokens: [Terminal.mod, NonTerminal.Int, NonTerminal.Int] },
        {
            id: 5,
            tokens: [Terminal.shift_r, NonTerminal.Int, NonTerminal.Int],
        },
        {
            id: 6,
            tokens: [Terminal.shift_l, NonTerminal.Int, NonTerminal.Int],
        },
        {
            id: 7,
            tokens: [Terminal.bit_and, NonTerminal.Int, NonTerminal.Int],
        },
        {
            id: 8,
            tokens: [Terminal.bit_or, NonTerminal.Int, NonTerminal.Int],
        },
        {
            id: 9,
            tokens: [Terminal.bit_xor, NonTerminal.Int, NonTerminal.Int],
        },
        // { id: 10, tokens: [Terminal.unary_plus, NonTerminal.Int] },
        { id: 10, tokens: [Terminal.unary_minus, NonTerminal.Int] },
        { id: 11, tokens: [Terminal.bit_not, NonTerminal.Int] },

        { id: 12, tokens: [Terminal.non_null_assert, NonTerminal.OptInt] },
        {
            id: 13,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.Int,
                NonTerminal.Int,
            ],
        },
        { id: 14, tokens: [Terminal.id_int] },
        { id: 15, tokens: [NonTerminal.LiteralInt] },
    ],
    [
        // Productions for OptInt
        { id: 0, tokens: [Terminal.opt_inj, NonTerminal.Int] },
        {
            id: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.OptInt,
                NonTerminal.OptInt,
            ],
        },
        { id: 2, tokens: [Terminal.id_opt_int] },
        { id: 3, tokens: [NonTerminal.LiteralOptInt] },
    ],
    [
        // Productions for LiteralInt
        { id: 0, tokens: [Terminal.integer] },
    ],
    [
        // Productions for LiteralOptInt
        // { id: 0, tokens: [Terminal.null] },
        { id: 0, tokens: [Terminal.opt_inj, NonTerminal.LiteralInt] },
    ],
    [
        // Productions for Bool
        { id: 0, tokens: [Terminal.eq, NonTerminal.Int, NonTerminal.Int] },
        {
            id: 1,
            tokens: [Terminal.eq, NonTerminal.OptInt, NonTerminal.OptInt],
        },
        { id: 2, tokens: [Terminal.eq, NonTerminal.Bool, NonTerminal.Bool] },
        {
            id: 3,
            tokens: [Terminal.eq, NonTerminal.OptBool, NonTerminal.OptBool],
        },
        {
            id: 4,
            tokens: [Terminal.eq, NonTerminal.Address, NonTerminal.Address],
        },
        {
            id: 5,
            tokens: [
                Terminal.eq,
                NonTerminal.OptAddress,
                NonTerminal.OptAddress,
            ],
        },
        { id: 6, tokens: [Terminal.eq, NonTerminal.Cell, NonTerminal.Cell] },
        {
            id: 7,
            tokens: [Terminal.eq, NonTerminal.OptCell, NonTerminal.OptCell],
        },
        {
            id: 8,
            tokens: [Terminal.eq, NonTerminal.Slice, NonTerminal.Slice],
        },
        {
            id: 9,
            tokens: [Terminal.eq, NonTerminal.OptSlice, NonTerminal.OptSlice],
        },
        {
            id: 10,
            tokens: [Terminal.eq, NonTerminal.String, NonTerminal.String],
        },
        {
            id: 11,
            tokens: [Terminal.eq, NonTerminal.OptString, NonTerminal.OptString],
        },

        { id: 12, tokens: [Terminal.neq, NonTerminal.Int, NonTerminal.Int] },
        {
            id: 13,
            tokens: [Terminal.neq, NonTerminal.OptInt, NonTerminal.OptInt],
        },
        {
            id: 14,
            tokens: [Terminal.neq, NonTerminal.Bool, NonTerminal.Bool],
        },
        {
            id: 15,
            tokens: [Terminal.neq, NonTerminal.OptBool, NonTerminal.OptBool],
        },
        {
            id: 16,
            tokens: [Terminal.neq, NonTerminal.Address, NonTerminal.Address],
        },
        {
            id: 17,
            tokens: [
                Terminal.neq,
                NonTerminal.OptAddress,
                NonTerminal.OptAddress,
            ],
        },
        {
            id: 18,
            tokens: [Terminal.neq, NonTerminal.Cell, NonTerminal.Cell],
        },
        {
            id: 19,
            tokens: [Terminal.neq, NonTerminal.OptCell, NonTerminal.OptCell],
        },
        {
            id: 20,
            tokens: [Terminal.neq, NonTerminal.Slice, NonTerminal.Slice],
        },
        {
            id: 21,
            tokens: [Terminal.neq, NonTerminal.OptSlice, NonTerminal.OptSlice],
        },
        {
            id: 22,
            tokens: [Terminal.neq, NonTerminal.String, NonTerminal.String],
        },
        {
            id: 23,
            tokens: [
                Terminal.neq,
                NonTerminal.OptString,
                NonTerminal.OptString,
            ],
        },

        { id: 24, tokens: [Terminal.lt, NonTerminal.Int, NonTerminal.Int] },
        { id: 25, tokens: [Terminal.le, NonTerminal.Int, NonTerminal.Int] },
        { id: 26, tokens: [Terminal.gt, NonTerminal.Int, NonTerminal.Int] },
        { id: 27, tokens: [Terminal.ge, NonTerminal.Int, NonTerminal.Int] },
        {
            id: 28,
            tokens: [Terminal.and, NonTerminal.Bool, NonTerminal.Bool],
        },
        {
            id: 29,
            tokens: [Terminal.or, NonTerminal.Bool, NonTerminal.Bool],
        },
        { id: 30, tokens: [Terminal.not, NonTerminal.Bool] },

        { id: 31, tokens: [Terminal.non_null_assert, NonTerminal.OptBool] },
        {
            id: 32,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.Bool,
                NonTerminal.Bool,
            ],
        },
        { id: 33, tokens: [Terminal.id_bool] },
        { id: 34, tokens: [NonTerminal.LiteralBool] },
    ],
    [
        // Productions for OptBool
        { id: 0, tokens: [Terminal.opt_inj, NonTerminal.Bool] },
        {
            id: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.OptBool,
                NonTerminal.OptBool,
            ],
        },
        { id: 2, tokens: [Terminal.id_opt_bool] },
        { id: 3, tokens: [NonTerminal.LiteralOptBool] },
    ],
    [
        // Productions for LiteralBool
        { id: 0, tokens: [Terminal.bool] },
    ],
    [
        // Productions for LiteralOptBool
        // { id: 0, tokens: [Terminal.null] },
        { id: 0, tokens: [Terminal.opt_inj, NonTerminal.LiteralBool] },
    ],
    [
        // Productions for Cell
        { id: 0, tokens: [Terminal.code_of] },

        { id: 1, tokens: [Terminal.non_null_assert, NonTerminal.OptCell] },
        {
            id: 2,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.Cell,
                NonTerminal.Cell,
            ],
        },
        { id: 3, tokens: [Terminal.id_cell] },
        { id: 4, tokens: [NonTerminal.LiteralCell] },
    ],
    [
        // Productions for OptCell
        { id: 0, tokens: [Terminal.opt_inj, NonTerminal.Cell] },
        {
            id: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.OptCell,
                NonTerminal.OptCell,
            ],
        },
        { id: 2, tokens: [Terminal.id_opt_cell] },
        { id: 3, tokens: [NonTerminal.LiteralOptCell] },
    ],
    [
        // Productions for LiteralCell
        { id: 0, tokens: [Terminal.cell] },
    ],
    [
        // Productions for LiteralOptCell
        // { id: 0, tokens: [Terminal.null] },
        { id: 0, tokens: [Terminal.opt_inj, NonTerminal.LiteralCell] },
    ],
    [
        // Productions for Slice
        { id: 0, tokens: [Terminal.non_null_assert, NonTerminal.OptSlice] },
        {
            id: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.Slice,
                NonTerminal.Slice,
            ],
        },
        { id: 2, tokens: [Terminal.id_slice] },
        { id: 3, tokens: [NonTerminal.LiteralSlice] },
    ],
    [
        // Productions for OptSlice
        { id: 0, tokens: [Terminal.opt_inj, NonTerminal.Slice] },
        {
            id: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.OptSlice,
                NonTerminal.OptSlice,
            ],
        },
        { id: 2, tokens: [Terminal.id_opt_slice] },
        { id: 3, tokens: [NonTerminal.LiteralOptSlice] },
    ],
    [
        // Productions for LiteralSlice
        { id: 0, tokens: [Terminal.slice] },
    ],
    [
        // Productions for LiteralOptSlice
        // { id: 0, tokens: [Terminal.null] },
        { id: 0, tokens: [Terminal.opt_inj, NonTerminal.LiteralSlice] },
    ],
    [
        // Productions for Address
        {
            id: 0,
            tokens: [Terminal.non_null_assert, NonTerminal.OptAddress],
        },
        {
            id: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.Address,
                NonTerminal.Address,
            ],
        },
        { id: 2, tokens: [Terminal.id_address] },
        { id: 3, tokens: [NonTerminal.LiteralAddress] },
    ],
    [
        // Productions for OptAddress
        { id: 0, tokens: [Terminal.opt_inj, NonTerminal.Address] },
        {
            id: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.OptAddress,
                NonTerminal.OptAddress,
            ],
        },
        { id: 2, tokens: [Terminal.id_opt_address] },
        { id: 3, tokens: [NonTerminal.LiteralOptAddress] },
    ],
    [
        // Productions for LiteralAddress
        { id: 0, tokens: [Terminal.address] },
    ],
    [
        // Productions for LiteralOptAddress
        // { id: 0, tokens: [Terminal.null] },
        { id: 0, tokens: [Terminal.opt_inj, NonTerminal.LiteralAddress] },
    ],
    [
        // Productions for String
        { id: 0, tokens: [Terminal.non_null_assert, NonTerminal.OptString] },
        {
            id: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.String,
                NonTerminal.String,
            ],
        },
        { id: 2, tokens: [Terminal.id_string] },
        { id: 3, tokens: [NonTerminal.LiteralString] },
    ],
    [
        // Productions for OptString
        { id: 0, tokens: [Terminal.opt_inj, NonTerminal.String] },
        {
            id: 1,
            tokens: [
                Terminal.cond,
                NonTerminal.Bool,
                NonTerminal.OptString,
                NonTerminal.OptString,
            ],
        },
        { id: 2, tokens: [Terminal.id_opt_string] },
        { id: 3, tokens: [NonTerminal.LiteralOptString] },
    ],
    [
        // Productions for LiteralString
        { id: 0, tokens: [Terminal.string] },
    ],
    [
        // Productions for LiteralOptString
        // { id: 0, tokens: [Terminal.null] },
        { id: 0, tokens: [Terminal.opt_inj, NonTerminal.LiteralString] },
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
    const bla = filteredCounts
        .slice(1)
        .reduce(
            (prev, curr) => prev + Math.log2(1 + 2 ** (curr - prev)),
            first,
        );
    return bla;
}

function normalizeArray(counts: number[]): number[] {
    // Any -Inf represents a count of 0, which means that such index should never get selected.
    // So, it is enough to transform -Inf back to 0.
    // Any 0 represents a count of 1. Since such index has a non-zero probability to be selected,
    // we change the 0s to 1s. The rest of numbers we take their ceil to transform them into integers.
    const bla = counts.map((n) => {
        if (n === Number.NEGATIVE_INFINITY) {
            return 0;
        }
        if (n === 0) {
            return 1;
        }
        return Math.ceil(n);
    });
    return bla;
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

    function countFromNonTerminal(id: number, size: number): number[] {
        const peekedCounts = peekNonTerminalCounts(id, size);
        if (typeof peekedCounts !== "undefined") {
            return peekedCounts;
        }
        const prods = getProductions(id);
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

    function doCountsForNonTerminals(nonTerminals: NonTerminalEnum[]) {
        // First, compute the counts of all the non-terminals that produce literals

        // The first step is to initialize the tables for size 0
        for (const nonTerminal of nonTerminals) {
            const nonTerminalIdx = nonTerminal.id;

            const productions = getProductions(nonTerminalIdx);

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

                const productions = getProductions(nonTerminalIdx);

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
            for (const nonTerminal of Object.values(NonTerminal)) {
                updateTotalCounts(nonTerminal.id, size, transform(0));
            }
        }

        for (let size = minSize; size <= maxSize; size++) {
            for (const nonTerminal of Object.values(NonTerminal)) {
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

    function computePartialSums(counts: number[]): number[] {
        if (counts.length === 0) {
            return counts;
        }
        const result: number[] = [counts[0]!];
        for (let i = 1; i < counts.length; i++) {
            result[i] = counts[i]! + result[i - 1]!;
        }
        return result;
    }

    function normalizeCounts() {
        // The total counts
        for (const nonTerminal of Object.values(NonTerminal)) {
            const counts = totalCounts[nonTerminal.id];
            if (typeof counts === "undefined") {
                throw new Error(`Index ${nonTerminal.id} out of bounds`);
            }
            const newCounts = computePartialSums(normalizeArray(counts));
            totalCounts[nonTerminal.id] = newCounts;
        }

        // The non-terminal counts
        for (const nonTerminal of Object.values(NonTerminal)) {
            for (let size = 0; size <= maxSize; size++) {
                const counts = lookupNonTerminalCounts(
                    nonTerminalCounts,
                    nonTerminal.id,
                    size,
                );
                const newCounts = computePartialSums(normalizeArray(counts));
                updateNonTerminalCounts(nonTerminal.id, size, newCounts);
            }
        }

        // Split size counts
        for (const nonTerminal of Object.values(NonTerminal)) {
            const nonTerminalIdx = nonTerminal.id;

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
                            nonTerminal.id,
                            prod.id,
                            tokenIndx,
                            size,
                        );
                        const newCounts = computePartialSums(
                            normalizeArray(counts),
                        );
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
        Object.values(NonTerminal).filter((nonTerminal) => nonTerminal.literal),
    );

    // Now the rest of non-terminals, but not the initial non-terminal
    doCountsForNonTerminals(
        Object.values(NonTerminal).filter(
            (nonTerminal) => !nonTerminal.literal && nonTerminal.id !== 0,
        ),
    );

    // Finally, the initial non-terminal
    doCountsForNonTerminals([NonTerminal.Initial]);

    doTotalCounts();

    // Now that the tables are filled, we need to normalize the counts
    // into non-negative integers (because they may be currently encoded
    // in a different way. For example, when using logarithms to represent
    // counts, the numbers have fractional part, and may also include -Inf).
    // Also, once they are normalized into non-negative integers,
    // we need to compute their partial sums, in preparation for the generation
    // process.
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

function getProductions(idx: number): ExprProduction[] {
    const prods = allProductions[idx];
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

function getNonTerminalAt(tokens: Token[], id: number): NonTerminalEnum {
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
    astF: FactoryAst,
    type: NonTerminalEnum,
    ctx: GenContext,
    nonTerminalCounts: number[][][],
    sizeSplitCounts: number[][][][][],
    size: number,
): fc.Arbitrary<Ast.Expression> {
    const makeF = getMakeAst(astF);
    const interpreter = new Interpreter(getAstUtil(astF));

    function genFromNonTerminal(
        id: number,
        size: number,
    ): fc.Arbitrary<Ast.Expression> {
        const prods = getProductions(id);
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
    ): fc.Arbitrary<Ast.Expression> {
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

    function makeBinaryOperatorTree(
        op: Ast.BinaryOperation,
        nonTerminalIndex: number,
        prodIndex: number,
        rest: Token[],
        size: number,
    ): fc.Arbitrary<Ast.Expression> {
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
                        ).chain((rightOperand) => {
                            // We need special logic to handle the shift operators, because they check
                            // at compile time if their right-hand side is within the range [0..256].
                            return handleShiftOperators(op, rightOperand).map(
                                (squashedRightOperand) =>
                                    makeF.makeDummyOpBinary(
                                        op,
                                        leftOperand,
                                        squashedRightOperand,
                                    ),
                            );
                        });
                    },
                );
            },
        );
    }

    function makeUnaryOperatorTree(
        op: Ast.UnaryOperation,
        rest: Token[],
        size: number,
    ): fc.Arbitrary<Ast.Expression> {
        const currSize = size - 1;

        const operandNonTerminal = getNonTerminalAt(rest, 0);
        return genFromNonTerminal(operandNonTerminal.id, currSize).map(
            (operand) => makeF.makeDummyOpUnary(op, operand),
        );
    }

    function makeIdentifier(t: AllowedTypeEnum): fc.Arbitrary<Ast.Expression> {
        const names = ctx.identifiers.get(t);
        if (typeof names === "undefined" || names.length === 0) {
            throw new Error(
                `There must exist at least one identifier for type ${t}`,
            );
        }
        return fc.constantFrom(...names).map((id) => makeF.makeDummyId(id));
    }

    function makeTree(
        nonTerminalIndex: number,
        prodIndex: number,
        head: TerminalEnum,
        rest: Token[],
        size: number,
    ): fc.Arbitrary<Ast.Expression> {
        switch (head.id) {
            case Terminal.integer.id: {
                return _generateIntBitLength(257, true).map((i) =>
                    makeF.makeDummyNumber(10, i),
                );
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
                return fc.boolean().map((b) => makeF.makeDummyBoolean(b));
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
                return _generateCell().map((c) => makeF.makeDummyCell(c));
            }
            case Terminal.code_of.id: {
                if (ctx.contractNames.length === 0) {
                    throw new Error(
                        "There must exist at least one contract name in generator context",
                    );
                }
                return fc
                    .constantFrom(...ctx.contractNames)
                    .map((name) =>
                        makeF.makeDummyCodeOf(makeF.makeDummyId(name)),
                    );
            }
            case Terminal.slice.id: {
                return _generateCell().map((c) =>
                    makeF.makeDummySlice(c.asSlice()),
                );
            }
            case Terminal.address.id: {
                return _generateAddress().map((a) => makeF.makeDummyAddress(a));
            }
            case Terminal.string.id: {
                return fc.string().map((s) => makeF.makeDummyString(s));
            }
            case Terminal.opt_inj.id: {
                const currSize = size - 1;
                const operandNonTerminal = getNonTerminalAt(rest, 0);
                return genFromNonTerminal(operandNonTerminal.id, currSize);
            }
            case Terminal.null.id: {
                return fc.constant(makeF.makeDummyNull());
            }
            case Terminal.non_null_assert.id: {
                return makeUnaryOperatorTree("!!", rest, size);
            }
            case Terminal.cond.id: {
                const currSize = size - 1;
                // Choose two splits for the size
                return chooseSizeSplit(
                    nonTerminalIndex,
                    prodIndex,
                    1,
                    currSize,
                ).chain((sizeSplit1) => {
                    return chooseSizeSplit(
                        nonTerminalIndex,
                        prodIndex,
                        2,
                        currSize - sizeSplit1,
                    ).chain((sizeSplit2) => {
                        const condNonTerminal = getNonTerminalAt(rest, 0);
                        const thenNonTerminal = getNonTerminalAt(rest, 1);
                        const elseNonTerminal = getNonTerminalAt(rest, 2);

                        return genFromNonTerminal(
                            condNonTerminal.id,
                            sizeSplit1,
                        ).chain((condOperand) => {
                            return genFromNonTerminal(
                                thenNonTerminal.id,
                                sizeSplit2,
                            ).chain((thenOperand) => {
                                return genFromNonTerminal(
                                    elseNonTerminal.id,
                                    currSize - sizeSplit1 - sizeSplit2,
                                ).map((elseOperand) =>
                                    makeF.makeDummyConditional(
                                        condOperand,
                                        thenOperand,
                                        elseOperand,
                                    ),
                                );
                            });
                        });
                    });
                });
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

    return genFromNonTerminal(type.id, size);
}

export function initializeGenerator(
    minSize: number,
    maxSize: number,
    astF: FactoryAst,
    ctx: GenContext,
    astF: FactoryAst,
): (type: NonTerminalEnum) => fc.Arbitrary<Ast.Expression> {
    const { nonTerminalCounts, sizeSplitCounts, totalCounts } =
        computeCountTables(minSize, maxSize);

    return (type: NonTerminalEnum) => {
        const sizes = lookupTotalCounts(totalCounts, type.id);
        const weightedSizes: fc.WeightedArbitrary<number>[] = sizes.map(
            (w, i) => {
                return { arbitrary: fc.constant(i), weight: w };
            },
        );

        return fc.oneof(...weightedSizes).chain((size) => {
            return makeExpression(
                astF,
                type,
                ctx,
                nonTerminalCounts,
                sizeSplitCounts,
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

function _generateIntBitLength(
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
