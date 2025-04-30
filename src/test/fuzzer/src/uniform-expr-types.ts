export const NonTerminal = {
    Initial: { terminal: false, literal: false, id: 0 },
    Int: { terminal: false, literal: false, id: 1 },
    OptInt: { terminal: false, literal: false, id: 2 },
    LiteralInt: { terminal: false, literal: true, id: 3 },
    // LiteralOptInt: { terminal: false, literal: true, id: 4 },
    Bool: { terminal: false, literal: false, id: 4 },
    OptBool: { terminal: false, literal: false, id: 5 },
    LiteralBool: { terminal: false, literal: true, id: 6 },
    // LiteralOptBool: { terminal: false, literal: true, id: 8 },
    Cell: { terminal: false, literal: false, id: 7 },
    OptCell: { terminal: false, literal: false, id: 8 },
    LiteralCell: { terminal: false, literal: true, id: 9 },
    // LiteralOptCell: { terminal: false, literal: true, id: 12 },
    Slice: { terminal: false, literal: false, id: 10 },
    OptSlice: { terminal: false, literal: false, id: 11 },
    LiteralSlice: { terminal: false, literal: true, id: 12 },
    // LiteralOptSlice: { terminal: false, literal: true, id: 16 },
    Address: { terminal: false, literal: false, id: 13 },
    OptAddress: { terminal: false, literal: false, id: 14 },
    LiteralAddress: { terminal: false, literal: true, id: 15 },
    // LiteralOptAddress: { terminal: false, literal: true, id: 20 },
    String: { terminal: false, literal: false, id: 16 },
    OptString: { terminal: false, literal: false, id: 17 },
    LiteralString: { terminal: false, literal: true, id: 18 },
    // LiteralOptString: { terminal: false, literal: true, id: 24 },
} as const;

export type NonTerminalEnum = (typeof NonTerminal)[keyof typeof NonTerminal];

export const Terminal = {
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
    //code_of: { terminal: true, id: 25 },

    slice: { terminal: true, id: 25 },

    address: { terminal: true, id: 26 },

    string: { terminal: true, id: 27 },

    // opt_inj: { terminal: true, id: 30 },
    // null: { terminal: true, id: 30 },
    non_null_assert: { terminal: true, id: 28 },

    cond: { terminal: true, id: 29 },

    id_int: { terminal: true, id: 30 },
    id_opt_int: { terminal: true, id: 31 },
    id_bool: { terminal: true, id: 32 },
    id_opt_bool: { terminal: true, id: 33 },
    id_cell: { terminal: true, id: 34 },
    id_opt_cell: { terminal: true, id: 35 },
    id_slice: { terminal: true, id: 36 },
    id_opt_slice: { terminal: true, id: 37 },
    id_address: { terminal: true, id: 38 },
    id_opt_address: { terminal: true, id: 39 },
    id_string: { terminal: true, id: 40 },
    id_opt_string: { terminal: true, id: 41 },
} as const;

export type TerminalEnum = (typeof Terminal)[keyof typeof Terminal];
