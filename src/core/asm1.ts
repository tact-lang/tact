import assert from 'assert';
import { Builder, Slice } from "@ton/core";
import * as S from "./cell-schema";
import * as $ from "@tonstudio/parser-runtime";
import { entries, enumObject } from "../utils/tricks";

type Ty<T> = {
    baseLen: number;
    store: (t: T, b: Builder) => void;
    load: (s: Slice) => T;
    preload: (s: Slice) => T;
    parse: $.Parser<T>;
    print: (t: T) => string;
}

const noArgs: Ty<[]> = {
    baseLen: 0,
    store: (_t, _b) => {},
    load: (_s) => [],
    preload: (_s) => [],
    parse: $.app($.str(''), () => []),
    print: () => '',
};

const unsignedNumber = $.lex($.stry($.plus($.regex<string>("0-9", [$.ExpRange("0", "9")]))));

const uint = (bits: number): Ty<number> => ({
    store: (t, b) => b.storeUint(t, bits),
    load: (s) => s.loadUint(bits),
    preload: (s) => s.preloadUint(bits),
    baseLen: bits,
    parse: $.app(unsignedNumber, (s) => {
        const n = BigInt(s);
        if (n >= (1n >> BigInt(bits))) {
            throw new Error(`Number must have no more than ${bits} bits`);
        }
        return Number(n);
    }),
    print: (n) => String(n),
});

const signedNumber = $.seq($.opt($.str("-")), unsignedNumber)

const int = (bits: number): Ty<number> => ({
    store: (t, b) => b.storeInt(t, bits),
    load: (s) => s.loadInt(bits),
    preload: (s) => s.preloadInt(bits),
    baseLen: bits,
    parse: $.app(signedNumber, ([p, s]) => {
        const n = BigInt((p ?? '') + s);
        if (n >= (1n >> BigInt(bits - 1)) || n < (1n >> BigInt(bits - 1))) {
            throw new Error(`Number must have no more than ${bits} bits`);
        }
        return Number(n);
    }),
    print: (n) => String(n),
});

const delta = (n: number, ty: Ty<number>): Ty<number> => ({
    store: (t, b) => { ty.store(t - n, b) },
    load: (s) => ty.load(s) + n,
    preload: (s) => ty.preload(s) + n,
    baseLen: ty.baseLen,
    parse: ty.parse,
    print: ty.print,
})


const stack = (bits: number): Ty<number> => {
    const ui = uint(bits);
    return {
        store: ui.store,
        load: ui.load,
        preload: ui.preload,
        baseLen: ui.baseLen,
        parse: $.lex($.right($.str("s"), ui.parse)),
        print: (n) => 's' + ui.print(n),
    };
};
const uint4 = uint(4);
const control: Ty<number> = {
    store: uint4.store,
    load: uint4.load,
    preload: uint4.preload,
    baseLen: uint4.baseLen,
    parse: $.lex($.right($.str("c"), uint4.parse)),
    print: (n) => 'c' + uint4.print(n),
};
// special case: XCHG s1 $
const s1Aux = stack(4);
const s1: Ty<number> = {
    baseLen: 0,
    store: (t, _b) => {
        if (t !== 1) {
            throw new Error('This opcode only takes s1');
        }
    },
    load: (_s) => 1,
    preload: (_s) => 1,
    parse: s1Aux.parse,
    print: s1Aux.print,
};
// special case: CALLXARGS $ -1
const minusOne: Ty<number> = {
    baseLen: 0,
    store: (t, _b) => {
        if (t !== -1) {
            throw new Error('This opcode only takes -1');
        }
    },
    load: (_s) => -1,
    preload: (_s) => -1,
    parse: uint4.parse,
    print: uint4.print,
};
// special case: RUNVM { ... }
// TODO:
// +1 = same_c3 (set c3 to code)
// +2 = push_0 (push an implicit 0 before running the code)
// +4 = load c4 (persistent data) from stack and return its final value
// +8 = load gas limit from stack and return consumed gas
// +16 = load c7 (smart-contract context)
// +32 = return c5 (actions)
// +64 = pop hard gas limit (enabled by ACCEPT) from stack as well
// +128 = isolated gas consumption (separate set of visited cells, reset chksgn counter)
// +256 = pop number N, return exactly N values from stack (only if res=0 or 1; if not enough then res=stk_und)
// if (mode >= 512) { throw new VmError(Excno.range_chk, "invalid flags"); }
const runvmArg = uint(12);

export enum Hash {
    SHA256 = 0,
    SHA512 = 1,
    BLAKE2B = 2,
    KECCAK256 = 3,
    KECCAK512 = 4,
}
const [hashHead, ...hashTail] = entries(enumObject(Hash))
    .map(([key, value]) => $.app($.str(key), () => value));
// eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
if (!hashHead) {
    throw new Error('Impossible');
}
const uint8 = uint(8);
const hash: Ty<Hash> = {
    store: (t, b) => { uint8.store(t, b); },
    load: (s) => {
        const r = uint8.load(s);
        if (!(r in Hash)) {
            throw new Error('Wrong hash');
        }
        return r;
    },
    preload: (s) => {
        const r = uint8.preload(s);
        if (!(r in Hash)) {
            throw new Error('Wrong hash');
        }
        return r;
    },
    baseLen: uint8.baseLen,
    parse: hashTail.reduce((acc, option) => $.alt(acc, option), hashHead),
    print: (t) => Hash[t],
};

const hexChar = $.regex<string>("0-9a-fA-F", [$.ExpRange("0", "9"), $.ExpRange("a", "f"), $.ExpRange("A", "F")]);
const sliceLiteral = $.lex($.right($.str("x{"), $.left($.stry($.star(hexChar)), $.str("}"))));

const slice = (bits: Ty<number>, pad: number): Ty<Buffer> => {
    const load = (s: Slice) => {
        const len = bits.load(s);
        const r = s.loadBuffer(len);
        s.loadUint(pad);
        return r;
    };
    return {
        store: (s, b) => {
            bits.store(s.length, b);
            b.storeBuffer(s);
            b.storeUint(0, pad);
        },
        load,
        preload: S.getPreload(load),
        baseLen: bits.baseLen,
        parse: $.app(sliceLiteral, s => {
            if (s.length >= (1 << bits.baseLen)) {
                throw new Error("Slice is too large");
            }
            return Buffer.from(s, "hex");
        }),
        print: (s) => s.toString("hex"),
    };
};

const seq1 = <T>(ty: Ty<T>): Ty<[T]> => ({
    store: ([t], b) => { ty.store(t, b); },
    load: (s) => [ty.load(s)],
    preload: (s) => [ty.preload(s)],
    baseLen: ty.baseLen,
    parse: $.app(ty.parse, (t) => [t]),
    print: ([t]) => ty.print(t),
});

const seq2 = <T, U>(t1: Ty<T>, t2: Ty<U>): Ty<[T, U]> => {
    const load = (s: Slice): [T, U] => [t1.load(s), t2.load(s)];
    return {
        store: ([t, u], b) => {
            t1.store(t, b);
            t2.store(u, b);
        },
        load,
        preload: S.getPreload(load),
        baseLen: t1.baseLen + t2.baseLen,
        parse: $.seq(t1.parse, t2.parse),
        print: ([t, u]) => t1.print(t) + ' ' + t2.print(u),
    };
};

const seq3 = <T, U, V>(t1: Ty<T>, t2: Ty<U>, t3: Ty<V>): Ty<[T, U, V]> => {
    const load = (s: Slice): [T, U, V] => [t1.load(s), t2.load(s), t3.load(s)];
    return {
        store: ([t, u, v], b) => {
            t1.store(t, b);
            t2.store(u, b);
            t3.store(v, b);
        },
        load,
        preload: S.getPreload(load),
        baseLen: t1.baseLen + t2.baseLen + t3.baseLen,
        parse: $.app(
            $.seq($.seq(t1.parse, t2.parse), t3.parse),
            ([[t, u], v]) => [t, u, v],
        ),
        print: ([t, u, v]) => t1.print(t) + ' ' + t2.print(u) + ' ' + t3.print(v),
    };
};

// special case: [-5, 10]
const tinyInt: Ty<number> = ({
    store: (t, b) => { uint4.store((t + 16) & 15, b); },
    load: (s) => ((uint4.load(s) + 5) & 15) - 5,
    preload: (s) => ((uint4.preload(s) + 5) & 15) - 5,
    baseLen: uint4.baseLen,
    parse: $.app(signedNumber, ([p, s]) => {
        const n = BigInt((p ?? '') + s);
        if (-5 < n || n > 10) {
            throw new Error(`Number must be in range [-5, 10]`);
        }
        return Number(n);
    }),
    print: (t) => String(t),
});

const uint5 = uint(5);
const loadLargeInt = (s: Slice) => s.loadIntBig(3 + ((uint5.load(s) & 31) + 2) * 8);
const largeInt: Ty<bigint> = ({
    store: (t, b) => {
        const len = t === 0n ? 1 : t.toString(2).length + (t < 0n ? 0 : 1);
        const len2 = ((len + 7) / 8) | 0 - 2;
        if (len2 < 0 || len2 >= 32) {
            throw new Error('Wrong bitlength');
        }
        uint5.store(len2, b);
        b.storeInt(t, len2);
    },
    load: loadLargeInt,
    preload: S.getPreload(loadLargeInt),
    baseLen: uint5.baseLen,
    parse: $.app(signedNumber, ([p, s]) => {
        const n = BigInt((p ?? '') + s);
        const len = n === 0n ? 1 : n.toString(2).length + (n < 0n ? 0 : 1);
        const len2 = ((len + 7) / 8) | 0 - 2;
        if (len2 < 0 || len2 >= 32) {
            throw new Error('Wrong bitlength');
        }
        return n;
    }),
    print: (t) => String(t),
});

// special case: plduz
const uint3 = uint(3);
const plduzArray = new Array(1 << 3).fill(0).map((_, i) => (i + 1) << 5);
const possiblePlduz = new Set(plduzArray);
const plduzArg: Ty<number> = {
    store: (t, b) => { uint3.store(((t >> 5) - 1) & 7, b); },
    load: (s) => ((uint3.load(s) & 7) + 1) << 5,
    preload: (s) => ((uint3.preload(s) & 7) + 1) << 5,
    baseLen: uint3.baseLen,
    parse: $.app(unsignedNumber, (s) => {
        const n = BigInt(s);
        if (n < 1000 && possiblePlduz.has(Number(n))) {
            throw new Error(`PLDUZ argument has to be one of: ${plduzArray.join(', ')}`);
        }
        return Number(n);
    }),
    print: (s) => String(s),
};

// special case: has deps between opcodes
const xchgArgsAux = seq2(stack(4), stack(4));
const validateXchg = ([x, y]: [number, number]) => {
    if (!x) {
        throw new Error(`First XCHG argument cannot be 0`);
    }
    if (x >= y) {
        throw new Error(`First XCHG argument should be larger than second`);
    }
};
const xchgArgs: Ty<[number, number]> = {
    store: (t, b) => {
        validateXchg(t);
        xchgArgsAux.store(t, b);
    },
    load: (s) => {
        const r = xchgArgsAux.load(s);
        validateXchg(r);
        return r;
    },
    preload: (s) => {
        const r = xchgArgsAux.preload(s);
        validateXchg(r);
        return r;
    },
    baseLen: xchgArgsAux.baseLen,
    parse: xchgArgsAux.parse,
    print: xchgArgsAux.print,
};

const adjoin = <T, K extends string>(name: K, ty: Ty<T>): Ty<[K, T]> => {
    return {
        store: ([, t], b) => { ty.store(t, b); },
        load: (s) => [name, ty.load(s)],
        preload: (s) => [name, ty.preload(s)],
        baseLen: ty.baseLen,
        parse: $.seq($.str(name), ty.parse),
        print: ([_, t]) => {
            const right = ty.print(t);
            return right.length > 0 ? `${name} ${right}` : name;
        },
    };
};

type Opcode<T, K> = {
    min: number;
    max: number;
    checkLen: number;
    skipLen: number;
    refs: number;
    name: K;
    exec: string;
    cat: string;
    version: undefined | number;
    args: Ty<[K, T]>;
}

const cat = <T, K>(cat: string, o: Opcode<T, K>): Opcode<T, K> => {
    return { ...o, cat };
};

const version = <T, K>(version: number, o: Opcode<T, K>): Opcode<T, K> => {
    return { ...o, version };
};

const max_opcode_bits = 24;
const top_opcode = 1 << max_opcode_bits;

const dummyName = '<ERROR>' as const;
const dummy = (
    min: number,
    max: number
): Opcode<[], typeof dummyName> => ({
    min,
    max,
    checkLen: 0,
    skipLen: 0,
    args: adjoin(dummyName, noArgs),
    name: dummyName,
    refs: 0,
    exec: dummyName,
    cat: '',
    version: undefined,
});

const mksimple = <K extends string>(
    opcode: number,
    pfxLen: number,
    name: K,
    exec: string,
): Opcode<[], K> => {
    return {
        min: opcode << (max_opcode_bits - pfxLen),
        max: (opcode + 1) << (max_opcode_bits - pfxLen),
        checkLen: pfxLen,
        skipLen: pfxLen,
        args: adjoin(name, noArgs),
        name,
        refs: 0,
        exec,
        cat: '',
        version: undefined,
    }
};

const mkfixedn = <T, K extends string>(
    opcode: number,
    pfxLen: number,
    argLen: number,
    name: K,
    args: Ty<T>,
    exec: string,
): Opcode<T, K> => {
    if (args.baseLen !== argLen) {
        throw new Error('Wrong schema');
    }
    return {
        min: opcode << (max_opcode_bits - pfxLen),
        max: (opcode + 1) << (max_opcode_bits - pfxLen),
        checkLen: pfxLen,
        skipLen: pfxLen + argLen,
        args: adjoin(name, args),
        name,
        refs: 0,
        exec,
        cat: '',
        version: undefined,
    };
};

const mkfixedrangen = <T, K extends string>(
    opcode_min: number,
    opcode_max: number,
    totLen: number,
    argLen: number,
    name: K,
    args: Ty<T>,
    exec: string,
): Opcode<T, K> => {
    if (args.baseLen !== argLen) {
        throw new Error('Wrong schema');
    }
    return {
        min: opcode_min << (max_opcode_bits - totLen),
        max: opcode_max << (max_opcode_bits - totLen),
        checkLen: totLen - argLen,
        skipLen: totLen,
        args: adjoin(name, args),
        name,
        refs: 0,
        exec,
        cat: '',
        version: undefined,
    };
};

const mkext = <T, K extends string>(
    refs: number,
    opcode: number,
    pfxLen: number,
    argLen: number,
    name: K,
    args: Ty<T>,
    exec: string,
): Opcode<T, K> => {
    if (args.baseLen !== argLen) {
        throw new Error('Wrong schema');
    }
    return {
        min: opcode << (max_opcode_bits - pfxLen),
        max: (opcode + 1) << (max_opcode_bits - pfxLen),
        checkLen: pfxLen,
        skipLen: pfxLen + argLen,
        args: adjoin(name, args),
        name,
        refs,
        exec,
        cat: '',
        version: undefined,
    };
};

const mkextrange = <T, K extends string>(
    refs: number,
    opcode_min: number,
    opcode_max: number,
    totLen: number,
    argLen: number,
    name: K,
    args: Ty<T>,
    exec: string,
): Opcode<T, K> => {
    if (args.baseLen !== argLen) {
        throw new Error('Wrong schema');
    }
    return {
        min: opcode_min << (max_opcode_bits - totLen),
        max: opcode_max << (max_opcode_bits - totLen),
        checkLen: totLen - argLen,
        skipLen: totLen,
        args: adjoin(name, args),
        name,
        refs,
        exec,
        cat: '',
        version: undefined,
    };
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const instructions = [
    cat("int_const", mksimple(0x83ff, 16, "PUSHNAN", `exec_push_nan`)),
    cat("add_mul", mksimple(0xa0, 8, "ADD", `(_1) => exec_add(_1, false)`)),
    cat("add_mul", mksimple(0xa1, 8, "SUB", `(_1) => exec_sub(_1, false)`)),
    cat("add_mul", mksimple(0xa2, 8, "SUBR", `(_1) => exec_subr(_1, false)`)),
    cat("add_mul", mksimple(0xa3, 8, "NEGATE", `(_1) => exec_negate(_1, false)`)),
    cat("add_mul", mksimple(0xa4, 8, "INC", `(_1) => exec_inc(_1, false)`)),
    cat("add_mul", mksimple(0xa5, 8, "DEC", `(_1) => exec_dec(_1, false)`)),
    cat("add_mul", mksimple(0xa8, 8, "MUL", `(_1) => exec_mul(_1, false)`)),
    cat("shift_logic", mksimple(0xac, 8, "LSHIFT", `(_1) => exec_lshift(_1, false)`)),
    cat("shift_logic", mksimple(0xad, 8, "RSHIFT", `(_1) => exec_rshift(_1, false)`)),
    cat("shift_logic", mksimple(0xae, 8, "POW2", `(_1) => exec_pow2(_1, false)`)),
    cat("shift_logic", mksimple(0xb0, 8, "AND", `(_1) => exec_and(_1, false)`)),
    cat("shift_logic", mksimple(0xb1, 8, "OR", `(_1) => exec_or(_1, false)`)),
    cat("shift_logic", mksimple(0xb2, 8, "XOR", `(_1) => exec_xor(_1, false)`)),
    cat("shift_logic", mksimple(0xb3, 8, "NOT", `(_1) => exec_not(_1, false)`)),
    cat("shift_logic", mksimple(0xb600, 16, "FITSX", `(_1) => exec_fits(_1, false)`)),
    cat("shift_logic", mksimple(0xb601, 16, "UFITSX", `(_1) => exec_ufits(_1, false)`)),
    cat("shift_logic", mksimple(0xb602, 16, "BITSIZE", `(_1) => exec_bitsize(_1, true, false)`)),
    cat("shift_logic", mksimple(0xb603, 16, "UBITSIZE", `(_1) => exec_bitsize(_1, false, false)`)),
    cat("other_arith", mksimple(0xb608, 16, "MIN", `(_1) => exec_minmax(_1, 2)`)),
    cat("other_arith", mksimple(0xb609, 16, "MAX", `(_1) => exec_minmax(_1, 4)`)),
    cat("other_arith", mksimple(0xb60a, 16, "MINMAX", `(_1) => exec_minmax(_1, 6)`)),
    cat("other_arith", mksimple(0xb60b, 16, "ABS", `(_1) => exec_abs(_1, false)`)),
    cat("add_mul", mksimple(0xb7a0, 16, "QADD", `(_1) => exec_add(_1, true)`)),
    cat("add_mul", mksimple(0xb7a1, 16, "QSUB", `(_1) => exec_sub(_1, true)`)),
    cat("add_mul", mksimple(0xb7a2, 16, "QSUBR", `(_1) => exec_subr(_1, true)`)),
    cat("add_mul", mksimple(0xb7a3, 16, "QNEGATE", `(_1) => exec_negate(_1, true)`)),
    cat("add_mul", mksimple(0xb7a4, 16, "QINC", `(_1) => exec_inc(_1, true)`)),
    cat("add_mul", mksimple(0xb7a5, 16, "QDEC", `(_1) => exec_dec(_1, true)`)),
    cat("add_mul", mksimple(0xb7a8, 16, "QMUL", `(_1) => exec_mul(_1, true)`)),
    cat("shift_logic", mksimple(0xb7ac, 16, "QLSHIFT", `(_1) => exec_lshift(_1, true)`)),
    cat("shift_logic", mksimple(0xb7ad, 16, "QRSHIFT", `(_1) => exec_rshift(_1, true)`)),
    cat("shift_logic", mksimple(0xb7ae, 16, "QPOW2", `(_1) => exec_pow2(_1, true)`)),
    cat("shift_logic", mksimple(0xb7b0, 16, "QAND", `(_1) => exec_and(_1, true)`)),
    cat("shift_logic", mksimple(0xb7b1, 16, "QOR", `(_1) => exec_or(_1, true)`)),
    cat("shift_logic", mksimple(0xb7b2, 16, "QXOR", `(_1) => exec_xor(_1, true)`)),
    cat("shift_logic", mksimple(0xb7b3, 16, "QNOT", `(_1) => exec_not(_1, true)`)),
    cat("shift_logic", mksimple(0xb7b600, 24, "QFITSX", `(_1) => exec_fits(_1, true)`)),
    cat("shift_logic", mksimple(0xb7b601, 24, "QUFITSX", `(_1) => exec_ufits(_1, true)`)),
    cat("shift_logic", mksimple(0xb7b602, 24, "QBITSIZE", `(_1) => exec_bitsize(_1, true, true)`)),
    cat("shift_logic", mksimple(0xb7b603, 24, "QUBITSIZE", `(_1) => exec_bitsize(_1, false, true)`)),
    cat("other_arith", mksimple(0xb7b608, 24, "QMIN", `(_1) => exec_minmax(_1, 3)`)),
    cat("other_arith", mksimple(0xb7b609, 24, "QMAX", `(_1) => exec_minmax(_1, 5)`)),
    cat("other_arith", mksimple(0xb7b60a, 24, "QMINMAX", `(_1) => exec_minmax(_1, 7)`)),
    cat("other_arith", mksimple(0xb7b60b, 24, "QABS", `(_1) => exec_abs(_1, true)`)),
    cat("int_cmp", mksimple(0xb8, 8, "SGN", `(_1) => exec_sgn(_1, 0x987, false, "SGN")`)),
    cat("int_cmp", mksimple(0xb9, 8, "LESS", `(_1) => exec_cmp(_1, 0x887, false, "LESS")`)),
    cat("int_cmp", mksimple(0xba, 8, "EQUAL", `(_1) => exec_cmp(_1, 0x878, false, "EQUAL")`)),
    cat("int_cmp", mksimple(0xbb, 8, "LEQ", `(_1) => exec_cmp(_1, 0x877, false, "LEQ")`)),
    cat("int_cmp", mksimple(0xbc, 8, "GREATER", `(_1) => exec_cmp(_1, 0x788, false, "GREATER")`)),
    cat("int_cmp", mksimple(0xbd, 8, "NEQ", `(_1) => exec_cmp(_1, 0x787, false, "NEQ")`)),
    cat("int_cmp", mksimple(0xbe, 8, "GEQ", `(_1) => exec_cmp(_1, 0x778, false, "GEQ")`)),
    cat("int_cmp", mksimple(0xbf, 8, "CMP", `(_1) => exec_cmp(_1, 0x987, false, "CMP")`)),
    cat("int_cmp", mksimple(0xc4, 8, "ISNAN", `exec_is_nan`)),
    cat("int_cmp", mksimple(0xc5, 8, "CHKNAN", `exec_chk_nan`)),
    cat("int_cmp", mksimple(0xb7b8, 16, "QSGN", `(_1) => exec_sgn(_1, 0x987, true, "QSGN")`)),
    cat("int_cmp", mksimple(0xb7b9, 16, "QLESS", `(_1) => exec_cmp(_1, 0x887, true, "QLESS")`)),
    cat("int_cmp", mksimple(0xb7ba, 16, "QEQUAL", `(_1) => exec_cmp(_1, 0x878, true, "QEQUAL")`)),
    cat("int_cmp", mksimple(0xb7bb, 16, "QLEQ", `(_1) => exec_cmp(_1, 0x877, true, "QLEQ")`)),
    cat("int_cmp", mksimple(0xb7bc, 16, "QGREATER", `(_1) => exec_cmp(_1, 0x788, true, "QGREATER")`)),
    cat("int_cmp", mksimple(0xb7bd, 16, "QNEQ", `(_1) => exec_cmp(_1, 0x787, true, "QNEQ")`)),
    cat("int_cmp", mksimple(0xb7be, 16, "QGEQ", `(_1) => exec_cmp(_1, 0x778, true, "QGEQ")`)),
    cat("int_cmp", mksimple(0xb7bf, 16, "QCMP", `(_1) => exec_cmp(_1, 0x987, true, "QCMP")`)),
    cat("cell_cmp", mksimple(0xc700, 16, "SEMPTY", `(_1) => exec_un_cs_cmp(_1, "SEMPTY", (cs) => cs.empty() && !cs.size_refs())`)),
    cat("cell_cmp", mksimple(0xc701, 16, "SDEMPTY", `(_1) => exec_un_cs_cmp(_1, "SDEMPTY", (cs) => cs.empty())`)),
    cat("cell_cmp", mksimple(0xc702, 16, "SREMPTY", `(_1) => exec_un_cs_cmp(_1, "SREMPTY", (cs) => !cs.size_refs())`)),
    cat("cell_cmp", mksimple(0xc703, 16, "SDFIRST", `(_1) => exec_un_cs_cmp(_1, "SDFIRST", (cs) => cs.prefetch_long(1) == -1)`)),
    cat("cell_cmp", mksimple(0xc704, 16, "SDLEXCMP", `(_1) => exec_ibin_cs_cmp(_1, "SDLEXCMP", (cs1, cs2) => cs1.lex_cmp(cs2))`)),
    cat("cell_cmp", mksimple(0xc705, 16, "SDEQ", `(_1) => exec_bin_cs_cmp(_1, "SDEQ", (cs1, cs2) => !cs1.lex_cmp(cs2))`)),
    cat("cell_cmp", mksimple(0xc708, 16, "SDPFX", `(_1) => exec_bin_cs_cmp(_1, "SDPFX", (cs1, cs2) => cs1.is_prefix_of(cs2))`)),
    cat("cell_cmp", mksimple(0xc709, 16, "SDPFXREV", `(_1) => exec_bin_cs_cmp(_1, "SDPFXREV", (cs1, cs2) => cs2.is_prefix_of(cs1))`)),
    cat("cell_cmp", mksimple(0xc70a, 16, "SDPPFX", `(_1) => exec_bin_cs_cmp(_1, "SDPPFX", (cs1, cs2) => cs1.is_proper_prefix_of(cs2))`)),
    cat("cell_cmp", mksimple(0xc70b, 16, "SDPPFXREV", `(_1) => exec_bin_cs_cmp(_1, "SDPPFXREV", (cs1, cs2) => cs2.is_proper_prefix_of(cs1))`)),
    cat("cell_cmp", mksimple(0xc70c, 16, "SDSFX", `(_1) => exec_bin_cs_cmp(_1, "SDSFX", (cs1, cs2) => cs1.is_suffix_of(cs2))`)),
    cat("cell_cmp", mksimple(0xc70d, 16, "SDSFXREV", `(_1) => exec_bin_cs_cmp(_1, "SDSFXREV", (cs1, cs2) => cs2.is_suffix_of(cs1))`)),
    cat("cell_cmp", mksimple(0xc70e, 16, "SDPSFX", `(_1) => exec_bin_cs_cmp(_1, "SDPSFX", (cs1, cs2) => cs1.is_proper_suffix_of(cs2))`)),
    cat("cell_cmp", mksimple(0xc70f, 16, "SDPSFXREV", `(_1) => exec_bin_cs_cmp(_1, "SDPSFXREV", (cs1, cs2) => cs2.is_proper_suffix_of(cs1))`)),
    cat("cell_cmp", mksimple(0xc710, 16, "SDCNTLEAD0", `(_1) => exec_iun_cs_cmp(_1, "SDCNTLEAD0", (cs) => cs.count_leading(0))`)),
    cat("cell_cmp", mksimple(0xc711, 16, "SDCNTLEAD1", `(_1) => exec_iun_cs_cmp(_1, "SDCNTLEAD1", (cs) => cs.count_leading(1))`)),
    cat("cell_cmp", mksimple(0xc712, 16, "SDCNTTRAIL0", `(_1) => exec_iun_cs_cmp(_1, "SDCNTTRAIL0", (cs) => cs.count_trailing(0))`)),
    cat("cell_cmp", mksimple(0xc713, 16, "SDCNTTRAIL1", `(_1) => exec_iun_cs_cmp(_1, "SDCNTTRAIL1", (cs) => cs.count_trailing(1))`)),
    cat("cell_serialize", mksimple(0xc8, 8, "NEWC", `exec_new_builder`)),
    cat("cell_serialize", mksimple(0xc9, 8, "ENDC", `exec_builder_to_cell`)),
    cat("cell_serialize", mksimple(0xcc, 8, "STREF", `(_1) => exec_store_ref(_1, false)`)),
    cat("cell_serialize", mksimple(0xcd, 8, "ENDCST", `(_1) => exec_store_builder_as_ref_rev(_1, false)`)),
    cat("cell_serialize", mksimple(0xce, 8, "STSLICE", `(_1) => exec_store_slice(_1, false)`)),
    cat("cell_serialize", mksimple(0xcf10, 16, "STREF", `(_1) => exec_store_ref(_1, false)`)),
    cat("cell_serialize", mksimple(0xcf11, 16, "STBREF", `(_1) => exec_store_builder_as_ref(_1, false)`)),
    cat("cell_serialize", mksimple(0xcf12, 16, "STSLICE", `(_1) => exec_store_slice(_1, false)`)),
    cat("cell_serialize", mksimple(0xcf13, 16, "STB", `(_1) => exec_store_builder(_1, false)`)),
    cat("cell_serialize", mksimple(0xcf14, 16, "STREFR", `(_1) => exec_store_ref_rev(_1, false)`)),
    cat("cell_serialize", mksimple(0xcf15, 16, "STBREFR", `(_1) => exec_store_builder_as_ref_rev(_1, false)`)),
    cat("cell_serialize", mksimple(0xcf16, 16, "STSLICER", `(_1) => exec_store_slice_rev(_1, false)`)),
    cat("cell_serialize", mksimple(0xcf17, 16, "STBR", `(_1) => exec_store_builder_rev(_1, false)`)),
    cat("cell_serialize", mksimple(0xcf18, 16, "STREFQ", `(_1) => exec_store_ref(_1, true)`)),
    cat("cell_serialize", mksimple(0xcf19, 16, "STBREFQ", `(_1) => exec_store_builder_as_ref(_1, true)`)),
    cat("cell_serialize", mksimple(0xcf1a, 16, "STSLICEQ", `(_1) => exec_store_slice(_1, true)`)),
    cat("cell_serialize", mksimple(0xcf1b, 16, "STBQ", `(_1) => exec_store_builder(_1, true)`)),
    cat("cell_serialize", mksimple(0xcf1c, 16, "STREFRQ", `(_1) => exec_store_ref_rev(_1, true)`)),
    cat("cell_serialize", mksimple(0xcf1d, 16, "STBREFRQ", `(_1) => exec_store_builder_as_ref_rev(_1, true)`)),
    cat("cell_serialize", mksimple(0xcf1e, 16, "STSLICERQ", `(_1) => exec_store_slice_rev(_1, true)`)),
    cat("cell_serialize", mksimple(0xcf1f, 16, "STBRQ", `(_1) => exec_store_builder_rev(_1, true)`)),
    cat("cell_serialize", mksimple(0xcf23, 16, "ENDXC", `exec_builder_to_special_cell`)),
    cat("cell_serialize", mksimple(0xcf30, 16, "BDEPTH", `x => exec_int_builder_func(x, "BDEPTH", b => b.get_depth())`)),
    cat("cell_serialize", mksimple(0xcf31, 16, "BBITS", `x => exec_int_builder_func(x, "BBITS", b => b.size())`)),
    cat("cell_serialize", mksimple(0xcf32, 16, "BREFS", `x => exec_int_builder_func(x, "BREFS", b => b.size_refs())`)),
    cat("cell_serialize", mksimple(0xcf33, 16, "BBITREFS", `x => exec_2int_builder_func(x, "BBITSREFS", b => [b.size(), b.size_refs()])`)),
    cat("cell_serialize", mksimple(0xcf35, 16, "BREMBITS", `x => exec_int_builder_func(x, "BREMBITS", b => b.remaining_bits())`)),
    cat("cell_serialize", mksimple(0xcf36, 16, "BREMREFS", `x => exec_int_builder_func(x, "BREMREFS", b => b.remaining_refs())`)),
    cat("cell_serialize", mksimple(0xcf37, 16, "BREMBITREFS", `x => exec_2int_builder_func(x, "BREMBITSREFS", b => [b.remaining_bits(), b.remaining_refs()])`)),
    cat("cell_serialize", mksimple(0xcf39, 16, "BCHKBITS", `(_1) => exec_builder_chk_bits_refs(_1, 1)`)),
    cat("cell_serialize", mksimple(0xcf3a, 16, "BCHKREFS", `(_1) => exec_builder_chk_bits_refs(_1, 2)`)),
    cat("cell_serialize", mksimple(0xcf3b, 16, "BCHKBITREFS", `(_1) => exec_builder_chk_bits_refs(_1, 3)`)),
    cat("cell_serialize", mksimple(0xcf3d, 16, "BCHKBITSQ", `(_1) => exec_builder_chk_bits_refs(_1, 5)`)),
    cat("cell_serialize", mksimple(0xcf3e, 16, "BCHKREFSQ", `(_1) => exec_builder_chk_bits_refs(_1, 6)`)),
    cat("cell_serialize", mksimple(0xcf3f, 16, "BCHKBITREFSQ", `(_1) => exec_builder_chk_bits_refs(_1, 7)`)),
    cat("cell_serialize", mksimple(0xcf40, 16, "STZEROES", `(_1) => exec_store_same(_1, "STZEROES", 0)`)),
    cat("cell_serialize", mksimple(0xcf41, 16, "STONES", `(_1) => exec_store_same(_1, "STONES", 1)`)),
    cat("cell_serialize", mksimple(0xcf42, 16, "STSAME", `(_1) => exec_store_same(_1, "STSAME", -1)`)),
    cat("cell_deserialize", mksimple(0xd0, 8, "CTOS", `exec_cell_to_slice`)),
    cat("cell_deserialize", mksimple(0xd1, 8, "ENDS", `exec_slice_chk_empty`)),
    cat("cell_deserialize", mksimple(0xd4, 8, "LDREF", `(_1) => exec_load_ref(_1, 0)`)),
    cat("cell_deserialize", mksimple(0xd5, 8, "LDREFRTOS", `(_1) => exec_load_ref_rev_to_slice(_1, 0)`)),
    cat("cell_deserialize", mksimple(0xd720, 16, "SDCUTFIRST", `x => exec_slice_op_args(x, "SDCUTFIRST", 1023, (cs, bits) => cs.only_first(bits))`)),
    cat("cell_deserialize", mksimple(0xd721, 16, "SDSKIPFIRST", `x => exec_slice_op_args(x, "SDSKIPFIRST", 1023, (cs, bits) => cs.skip_first(bits))`)),
    cat("cell_deserialize", mksimple(0xd722, 16, "SDCUTLAST", `x => exec_slice_op_args(x, "SDCUTLAST", 1023, (cs, bits) => cs.only_last(bits))`)),
    cat("cell_deserialize", mksimple(0xd723, 16, "SDSKIPLAST", `x => exec_slice_op_args(x, "SDSKIPLAST", 1023, (cs, bits) => cs.skip_last(bits))`)),
    cat("cell_deserialize", mksimple(0xd724, 16, "SDSUBSTR", `x => exec_slice_op_args2(x, "SDSUBSTR", 1023, 1023, (cs, offs, bits) => cs.skip_first(offs) && cs.only_first(bits))`)),
    cat("cell_deserialize", mksimple(0xd726, 16, "SDBEGINSX", `(_1) => exec_slice_begins_with(_1, false)`)),
    cat("cell_deserialize", mksimple(0xd727, 16, "SDBEGINSXQ", `(_1) => exec_slice_begins_with(_1, true)`)),
    cat("cell_deserialize", mksimple(0xd730, 16, "SCUTFIRST", `x => exec_slice_op_args2(x, "SCUTFIRST", 1023, 4, (cs, bits, refs) => cs.only_first(bits, refs))`)),
    cat("cell_deserialize", mksimple(0xd731, 16, "SSKIPFIRST", `x => exec_slice_op_args2(x, "SSKIPFIRST", 1023, 4, (cs, bits, refs) => cs.skip_first(bits, refs))`)),
    cat("cell_deserialize", mksimple(0xd732, 16, "SCUTLAST", `x => exec_slice_op_args2(x, "SCUTLAST", 1023, 4, (cs, bits, refs) => cs.only_last(bits, refs))`)),
    cat("cell_deserialize", mksimple(0xd733, 16, "SSKIPLAST", `x => exec_slice_op_args2(x, "SSKIPLAST", 1023, 4, (cs, bits, refs) => cs.skip_last(bits, refs))`)),
    cat("cell_deserialize", mksimple(0xd734, 16, "SUBSLICE", `exec_subslice`)),
    cat("cell_deserialize", mksimple(0xd736, 16, "SPLIT", `(_1) => exec_split(_1, false)`)),
    cat("cell_deserialize", mksimple(0xd737, 16, "SPLITQ", `(_1) => exec_split(_1, true)`)),
    cat("cell_deserialize", mksimple(0xd739, 16, "XCTOS", `exec_cell_to_slice_maybe_special`)),
    cat("cell_deserialize", mksimple(0xd73a, 16, "XLOAD", `(_1) => exec_load_special_cell(_1, false)`)),
    cat("cell_deserialize", mksimple(0xd73b, 16, "XLOADQ", `(_1) => exec_load_special_cell(_1, true)`)),
    cat("cell_deserialize", mksimple(0xd741, 16, "SCHKBITS", `x => exec_slice_chk_op_args(x, "SCHKBITS", 1023, false, (cs, bits) => cs.have(bits))`)),
    cat("cell_deserialize", mksimple(0xd742, 16, "SCHKREFS", `x => exec_slice_chk_op_args(x, "SCHKREFS", 1023, false, (cs, refs) => cs.have_refs(refs))`)),
    cat("cell_deserialize", mksimple(0xd743, 16, "SCHKBITREFS", `x => exec_slice_chk_op_args2(x, "SCHKBITREFS", 1023, 4, false, (cs, bits, refs) => cs.have(bits) && cs.have_refs(refs))`)),
    cat("cell_deserialize", mksimple(0xd745, 16, "SCHKBITSQ", `x => exec_slice_chk_op_args(x, "SCHKBITSQ", 1023, true, (cs, bits) => cs.have(bits))`)),
    cat("cell_deserialize", mksimple(0xd746, 16, "SCHKREFSQ", `x => exec_slice_chk_op_args(x, "SCHKREFSQ", 1023, true, (cs, refs) => cs.have_refs(refs))`)),
    cat("cell_deserialize", mksimple(0xd747, 16, "SCHKBITREFSQ", `x => exec_slice_chk_op_args2(x, "SCHKBITREFSQ", 1023, 4, true, (cs, bits, refs) => cs.have(bits) && cs.have_refs(refs))`)),
    cat("cell_deserialize", mksimple(0xd748, 16, "PLDREFVAR", `exec_preload_ref`)),
    cat("cell_deserialize", mksimple(0xd749, 16, "SBITS", `(_1) => exec_slice_bits_refs(_1, 1)`)),
    cat("cell_deserialize", mksimple(0xd74a, 16, "SREFS", `(_1) => exec_slice_bits_refs(_compute_len_slice_begins_with_const1, 2)`)),
    cat("cell_deserialize", mksimple(0xd74b, 16, "SBITREFS", `(_1) => exec_slice_bits_refs(_1, 3)`)),
    cat("cell_deserialize", mksimple(0xd760, 16, "LDZEROES", `(_1) => exec_load_same(_1, "LDZEROES", 0)`)),
    cat("cell_deserialize", mksimple(0xd761, 16, "LDONES", `(_1) => exec_load_same(_1, "LDONES", 1)`)),
    cat("cell_deserialize", mksimple(0xd762, 16, "LDSAME", `(_1) => exec_load_same(_1, "LDSAME", -1)`)),
    cat("cell_deserialize", mksimple(0xd764, 16, "SDEPTH", `exec_slice_depth`)),
    cat("cell_deserialize", mksimple(0xd765, 16, "CDEPTH", `exec_cell_depth`)),
    version(6, cat("cell_deserialize", mksimple(0xd766, 16, "CLEVEL", `exec_cell_level`))),
    version(6, cat("cell_deserialize", mksimple(0xd767, 16, "CLEVELMASK", `exec_cell_level_mask`))),
    version(6, cat("cell_deserialize", mksimple(0xd770, 16, "CHASHIX ", ` (_1) => exec_cell_hash_i(_1, 0, true)`))),
    version(6, cat("cell_deserialize", mksimple(0xd771, 16, "CDEPTHIX ", ` (_1) => exec_cell_depth_i(_1, 0, true)`))),
    cat("continuation_jump", mksimple(0xd8, 8, "EXECUTE", `exec_execute`)),
    cat("continuation_jump", mksimple(0xd9, 8, "JMPX", `exec_jmpx`)),
    cat("continuation_jump", mksimple(0xdb30, 16, "RET", `exec_ret`)),
    cat("continuation_jump", mksimple(0xdb31, 16, "RETALT", `exec_ret_alt`)),
    cat("continuation_jump", mksimple(0xdb32, 16, "RETBOOL", `exec_ret_bool`)),
    cat("continuation_jump", mksimple(0xdb34, 16, "CALLCC", `exec_callcc`)),
    cat("continuation_jump", mksimple(0xdb35, 16, "JMPXDATA", `exec_jmpx_data`)),
    cat("continuation_jump", mksimple(0xdb38, 16, "CALLXVARARGS", `exec_callx_varargs`)),
    cat("continuation_jump", mksimple(0xdb39, 16, "RETVARARGS", `exec_ret_varargs`)),
    cat("continuation_jump", mksimple(0xdb3a, 16, "JMPXVARARGS", `exec_jmpx_varargs`)),
    cat("continuation_jump", mksimple(0xdb3b, 16, "CALLCCVARARGS", `exec_callcc_varargs`)),
    cat("continuation_jump", mksimple(0xdb3f, 16, "RETDATA", `exec_ret_data`)),
    version(4, cat("continuation_jump", mksimple(0xdb50, 16, "RUNVMX ", ` exec_runvmx`))),
    cat("continuation_cond_loop", mksimple(0xdc, 8, "IFRET", `exec_ifret`)),
    cat("continuation_cond_loop", mksimple(0xdd, 8, "IFNOTRET", `exec_ifnotret`)),
    cat("continuation_cond_loop", mksimple(0xde, 8, "IF", `exec_if`)),
    cat("continuation_cond_loop", mksimple(0xdf, 8, "IFNOT", `exec_ifnot`)),
    cat("continuation_cond_loop", mksimple(0xe0, 8, "IFJMP", `exec_if_jmp`)),
    cat("continuation_cond_loop", mksimple(0xe1, 8, "IFNOTJMP", `exec_ifnot_jmp`)),
    cat("continuation_cond_loop", mksimple(0xe2, 8, "IFELSE", `exec_if_else`)),
    cat("continuation_cond_loop", mksimple(0xe304, 16, "CONDSEL", `exec_condsel`)),
    cat("continuation_cond_loop", mksimple(0xe305, 16, "CONDSELCHK", `exec_condsel_chk`)),
    cat("continuation_cond_loop", mksimple(0xe308, 16, "IFRETALT", `exec_ifretalt`)),
    cat("continuation_cond_loop", mksimple(0xe309, 16, "IFNOTRETALT", `exec_ifnotretalt`)),
    cat("continuation_cond_loop", mksimple(0xe4, 8, "REPEAT", `(_1) => exec_repeat(_1, false)`)),
    cat("continuation_cond_loop", mksimple(0xe5, 8, "REPEATEND", `(_1) => exec_repeat_end(_1, false)`)),
    cat("continuation_cond_loop", mksimple(0xe6, 8, "UNTIL", `(_1) => exec_until(_1, false)`)),
    cat("continuation_cond_loop", mksimple(0xe7, 8, "UNTILEND", `(_1) => exec_until_end(_1, false)`)),
    cat("continuation_cond_loop", mksimple(0xe8, 8, "WHILE", `(_1) => exec_while(_1, false)`)),
    cat("continuation_cond_loop", mksimple(0xe9, 8, "WHILEEND", `(_1) => exec_while_end(_1, false)`)),
    cat("continuation_cond_loop", mksimple(0xea, 8, "AGAIN", `(_1) => exec_again(_1, false)`)),
    cat("continuation_cond_loop", mksimple(0xeb, 8, "AGAINEND", `(_1) => exec_again_end(_1, false)`)),
    cat("continuation_cond_loop", mksimple(0xe314, 16, "REPEATBRK", `(_1) => exec_repeat(_1, true)`)),
    cat("continuation_cond_loop", mksimple(0xe315, 16, "REPEATENDBRK", `(_1) => exec_repeat_end(_1, true)`)),
    cat("continuation_cond_loop", mksimple(0xe316, 16, "UNTILBRK", `(_1) => exec_until(_1, true)`)),
    cat("continuation_cond_loop", mksimple(0xe317, 16, "UNTILENDBRK", `(_1) => exec_until_end(_1, true)`)),
    cat("continuation_cond_loop", mksimple(0xe318, 16, "WHILEBRK", `(_1) => exec_while(_1, true)`)),
    cat("continuation_cond_loop", mksimple(0xe319, 16, "WHILEENDBRK", `(_1) => exec_while_end(_1, true)`)),
    cat("continuation_cond_loop", mksimple(0xe31a, 16, "AGAINBRK", `(_1) => exec_again(_1, true)`)),
    cat("continuation_cond_loop", mksimple(0xe31b, 16, "AGAINENDBRK", `(_1) => exec_again_end(_1, true)`)),
    cat("continuation_change", mksimple(0xed10, 16, "RETURNVARARGS", `exec_return_varargs`)),
    cat("continuation_change", mksimple(0xed11, 16, "SETCONTVARARGS", `exec_setcont_varargs`)),
    cat("continuation_change", mksimple(0xed12, 16, "SETNUMVARARGS", `exec_setnum_varargs`)),
    cat("continuation_change", mksimple(0xed1e, 16, "BLESS", `exec_bless`)),
    cat("continuation_change", mksimple(0xed1f, 16, "BLESSVARARGS", `exec_bless_varargs`)),
    cat("continuation_change", mksimple(0xede0, 16, "PUSHCTRX", `exec_push_ctr_var`)),
    cat("continuation_change", mksimple(0xede1, 16, "POPCTRX", `exec_pop_ctr_var`)),
    cat("continuation_change", mksimple(0xede2, 16, "SETCONTCTRX", `exec_setcont_ctr_var`)),
    version(9, cat("continuation_change", mksimple(0xede4, 16, "SETCONTCTRMANYX", `exec_setcont_ctr_many_var`))),
    cat("continuation_change", mksimple(0xedf0, 16, "BOOLAND", `(_1) => exec_compos(_1, 1, "BOOLAND")`)),
    cat("continuation_change", mksimple(0xedf1, 16, "BOOLOR", `(_1) => exec_compos(_1, 2, "BOOLOR")`)),
    cat("continuation_change", mksimple(0xedf2, 16, "COMPOSBOTH", `(_1) => exec_compos(_1, 3, "COMPOSBOTH")`)),
    cat("continuation_change", mksimple(0xedf3, 16, "ATEXIT", `exec_atexit`)),
    cat("continuation_change", mksimple(0xedf4, 16, "ATEXITALT", `exec_atexit_alt`)),
    cat("continuation_change", mksimple(0xedf5, 16, "SETEXITALT", `exec_setexit_alt`)),
    cat("continuation_change", mksimple(0xedf6, 16, "THENRET", `exec_thenret`)),
    cat("continuation_change", mksimple(0xedf7, 16, "THENRETALT", `exec_thenret_alt`)),
    cat("continuation_change", mksimple(0xedf8, 16, "INVERT", `exec_invert`)),
    cat("continuation_change", mksimple(0xedf9, 16, "BOOLEVAL", `exec_booleval`)),
    cat("continuation_change", mksimple(0xedfa, 16, "SAMEALT", `(_1) => exec_samealt(_1, false)`)),
    cat("continuation_change", mksimple(0xedfb, 16, "SAMEALTSAVE", `(_1) => exec_samealt(_1, true)`)),
    cat("exception", mksimple(0xf2ff, 16, "TRY", `(_1) => exec_try(_1, -1)`)),
    cat("codepage", mksimple(0xfff0, 16, "SETCPX", `exec_set_cp_any`)),
    cat("debug_enabled", mksimple(0xfe00, 16, "DUMPSTK", `exec_dump_stack`)),
    cat("debug_enabled", mksimple(0xfe14, 16, "STRDUMP", `exec_dump_string`)),
    cat("dictionary", mksimple(0xf400, 16, "STDICT", `exec_store_dict`)),
    cat("dictionary", mksimple(0xf401, 16, "SKIPDICT", `exec_skip_dict`)),
    cat("dictionary", mksimple(0xf402, 16, "LDDICTS", `(_1) => exec_load_dict_slice(_1, 0)`)),
    cat("dictionary", mksimple(0xf403, 16, "PLDDICTS", `(_1) => exec_load_dict_slice(_1, 1)`)),
    cat("dictionary", mksimple(0xf404, 16, "LDDICT", `(_1) => exec_load_dict(_1, 0)`)),
    cat("dictionary", mksimple(0xf405, 16, "PLDDICT", `(_1) => exec_load_dict(_1, 1)`)),
    cat("dictionary", mksimple(0xf406, 16, "LDDICTQ", `(_1) => exec_load_dict(_1, 2)`)),
    cat("dictionary", mksimple(0xf407, 16, "PLDDICTQ", `(_1) => exec_load_dict(_1, 3)`)),
    cat("dictionary", mksimple(0xf470, 16, "PFXDICTSET", `(_1) => exec_pfx_dict_set(_1, SetMode.Set, "SET")`)),
    cat("dictionary", mksimple(0xf471, 16, "PFXDICTREPLACE", `(_1) => exec_pfx_dict_set(_1, SetMode.Replace, "REPLACE")`)),
    cat("dictionary", mksimple(0xf472, 16, "PFXDICTADD", `(_1) => exec_pfx_dict_set(_1, SetMode.Add, "ADD")`)),
    cat("dictionary", mksimple(0xf473, 16, "PFXDICTDEL", `exec_pfx_dict_delete`)),
    cat("dictionary", mksimple(0xf4a8, 16, "PFXDICTGETQ", `(_1) => exec_pfx_dict_get(_1, 0, "Q")`)),
    cat("dictionary", mksimple(0xf4a9, 16, "PFXDICTGET", `(_1) => exec_pfx_dict_get(_1, 1, "")`)),
    cat("dictionary", mksimple(0xf4aa, 16, "PFXDICTGETJMP", `(_1) => exec_pfx_dict_get(_1, 2, "JMP")`)),
    cat("dictionary", mksimple(0xf4ab, 16, "PFXDICTGETEXEC", `(_1) => exec_pfx_dict_get(_1, 3, "EXEC")`)),
    cat("stack", mksimple(0x00, 8, "NOP", `exec_nop`)),
    cat("stack", mksimple(0x01, 8, "SWAP", `exec_swap`)),
    cat("stack", mksimple(0x20, 8, "DUP", `exec_dup`)),
    cat("stack", mksimple(0x21, 8, "OVER", `exec_over`)),
    cat("stack", mksimple(0x30, 8, "DROP", `exec_drop`)),
    cat("stack", mksimple(0x31, 8, "NIP", `exec_nip`)),
    cat("stack", mksimple(0x58, 8, "ROT", `exec_rot`)),
    cat("stack", mksimple(0x59, 8, "ROTREV", `exec_rotrev`)),
    cat("stack", mksimple(0x5a, 8, "2SWAP", `exec_2swap`)),
    cat("stack", mksimple(0x5b, 8, "2DROP", `exec_2drop`)),
    cat("stack", mksimple(0x5c, 8, "2DUP", `exec_2dup`)),
    cat("stack", mksimple(0x5d, 8, "2OVER", `exec_2over`)),
    cat("stack", mksimple(0x60, 8, "PICK", `exec_pick`)),
    cat("stack", mksimple(0x61, 8, "ROLL", `exec_roll`)),
    cat("stack", mksimple(0x62, 8, "ROLLREV", `exec_rollrev`)),
    cat("stack", mksimple(0x63, 8, "BLKSWX", `exec_blkswap_x`)),
    cat("stack", mksimple(0x64, 8, "REVX", `exec_reverse_x`)),
    cat("stack", mksimple(0x65, 8, "DROPX", `exec_drop_x`)),
    cat("stack", mksimple(0x66, 8, "TUCK", `exec_tuck`)),
    cat("stack", mksimple(0x67, 8, "XCHGX", `exec_xchg_x`)),
    cat("stack", mksimple(0x68, 8, "DEPTH", `exec_depth`)),
    cat("stack", mksimple(0x69, 8, "CHKDEPTH", `exec_chkdepth`)),
    cat("stack", mksimple(0x6a, 8, "ONLYTOPX", `exec_onlytop_x`)),
    cat("stack", mksimple(0x6b, 8, "ONLYX", `exec_only_x`)),
    cat("basic_gas", mksimple(0xf800, 16, "ACCEPT", `exec_accept`)),
    cat("basic_gas", mksimple(0xf801, 16, "SETGASLIMIT", `exec_set_gas_limit`)),
    version(4, cat("basic_gas", mksimple(0xf807, 16, "GASCONSUMED", `exec_gas_consumed`))),
    cat("basic_gas", mksimple(0xf80f, 16, "COMMIT", `exec_commit`)),
    cat("config", mksimple(0xf823, 16, "NOW", `(_1) => exec_get_param(_1, 3, "NOW")`)),
    cat("config", mksimple(0xf824, 16, "BLOCKLT", `(_1) => exec_get_param(_1, 4, "BLOCKLT")`)),
    cat("config", mksimple(0xf825, 16, "LTIME", `(_1) => exec_get_param(_1, 5, "LTIME")`)),
    cat("config", mksimple(0xf826, 16, "RANDSEED", `(_1) => exec_get_param(_1, 6, "RANDSEED")`)),
    cat("config", mksimple(0xf827, 16, "BALANCE", `(_1) => exec_get_param(_1, 7, "BALANCE")`)),
    cat("config", mksimple(0xf828, 16, "MYADDR", `(_1) => exec_get_param(_1, 8, "MYADDR")`)),
    cat("config", mksimple(0xf829, 16, "CONFIGROOT", `(_1) => exec_get_param(_1, 9, "CONFIGROOT")`)),
    cat("config", mksimple(0xf82a, 16, "MYCODE", `(_1) => exec_get_param(_1, 10, "MYCODE")`)),
    cat("config", mksimple(0xf82b, 16, "INCOMINGVALUE", `(_1) => exec_get_param(_1, 11, "INCOMINGVALUE")`)),
    cat("config", mksimple(0xf82c, 16, "STORAGEFEES", `(_1) => exec_get_param(_1, 12, "STORAGEFEES")`)),
    cat("config", mksimple(0xf82d, 16, "PREVBLOCKSINFOTUPLE", `(_1) => exec_get_param(_1, 13, "PREVBLOCKSINFOTUPLE")`)),
    cat("config", mksimple(0xf82e, 16, "UNPACKEDCONFIGTUPLE", `(_1) => exec_get_param(_1, 14, "UNPACKEDCONFIGTUPLE")`)),
    cat("config", mksimple(0xf82f, 16, "DUEPAYMENT", `(_1) => exec_get_param(_1, 15, "DUEPAYMENT")`)),
    cat("config", mksimple(0xf830, 16, "CONFIGDICT", `exec_get_config_dict`)),
    cat("config", mksimple(0xf832, 16, "CONFIGPARAM", `(_1) => exec_get_config_param(_1, false)`)),
    cat("config", mksimple(0xf833, 16, "CONFIGOPTPARAM", `(_1) => exec_get_config_param(_1, true)`)),
    version(4, cat("config", mksimple(0xf83400, 24, "PREVMCBLOCKS", `(_1) => exec_get_prev_blocks_info(_1, 0, "PREVMCBLOCKS")`))),
    version(4, cat("config", mksimple(0xf83401, 24, "PREVKEYBLOCK", `(_1) => exec_get_prev_blocks_info(_1, 1, "PREVKEYBLOCK")`))),
    version(9, cat("config", mksimple(0xf83402, 24, "PREVMCBLOCKS_100", `(_1) => exec_get_prev_blocks_info(_1, 2, "PREVMCBLOCKS_100")`))),
    version(4, cat("config", mksimple(0xf835, 16, "GLOBALID", `exec_get_global_id`))),
    version(6, cat("config", mksimple(0xf836, 16, "GETGASFEE", `exec_get_gas_fee`))),
    version(6, cat("config", mksimple(0xf837, 16, "GETSTORAGEFEE", `exec_get_storage_fee`))),
    version(6, cat("config", mksimple(0xf838, 16, "GETFORWARDFEE", `exec_get_forward_fee`))),
    version(6, cat("config", mksimple(0xf839, 16, "GETPRECOMPILEDGAS", `exec_get_precompiled_gas`))),
    version(6, cat("config", mksimple(0xf83a, 16, "GETORIGINALFWDFEE", `exec_get_original_fwd_fee`))),
    version(6, cat("config", mksimple(0xf83b, 16, "GETGASFEESIMPLE", `exec_get_gas_fee_simple`))),
    version(6, cat("config", mksimple(0xf83c, 16, "GETFORWARDFEESIMPLE", `exec_get_forward_fee_simple`))),
    cat("config", mksimple(0xf840, 16, "GETGLOBVAR", `exec_get_global_var`)),
    cat("config", mksimple(0xf860, 16, "SETGLOBVAR", `exec_set_global_var`)),
    cat("prng", mksimple(0xf810, 16, "RANDU256", `exec_randu256`)),
    cat("prng", mksimple(0xf811, 16, "RAND", `exec_rand_int`)),
    cat("prng", mksimple(0xf814, 16, "SETRAND", `(_1) => exec_set_rand(_1, false)`)),
    cat("prng", mksimple(0xf815, 16, "ADDRAND", `(_1) => exec_set_rand(_1, true)`)),
    cat("crypto", mksimple(0xf900, 16, "HASHCU", `(_1) => exec_compute_hash(_1, 0)`)),
    cat("crypto", mksimple(0xf901, 16, "HASHSU", `(_1) => exec_compute_hash(_1, 1)`)),
    cat("crypto", mksimple(0xf902, 16, "SHA256U", `exec_compute_sha256`)),
    cat("crypto", mksimple(0xf910, 16, "CHKSIGNU", `(_1) => exec_ed25519_check_signature(_1, false)`)),
    cat("crypto", mksimple(0xf911, 16, "CHKSIGNS", `(_1) => exec_ed25519_check_signature(_1, true)`)),
    version(4, cat("crypto", mksimple(0xf912, 16, "ECRECOVER", `exec_ecrecover`))),
    version(9, cat("crypto", mksimple(0xf913, 16, "SECP256K1_XONLY_PUBKEY_TWEAK_ADD", `exec_secp256k1_xonly_pubkey_tweak_add`))),
    version(4, cat("crypto", mksimple(0xf914, 16, "P256_CHKSIGNU", `(_1) => exec_p256_chksign(_1, false)`))),
    version(4, cat("crypto", mksimple(0xf915, 16, "P256_CHKSIGNS", `(_1) => exec_p256_chksign(_1, true)`))),
    version(4, cat("crypto", mksimple(0xf920, 16, "RIST255_FROMHASH", `exec_ristretto255_from_hash`))),
    version(4, cat("crypto", mksimple(0xf921, 16, "RIST255_VALIDATE", `(_1) => exec_ristretto255_validate(_1, false)`))),
    version(4, cat("crypto", mksimple(0xf922, 16, "RIST255_ADD", `(_1) => exec_ristretto255_add(_1, false)`))),
    version(4, cat("crypto", mksimple(0xf923, 16, "RIST255_SUB", `(_1) => exec_ristretto255_sub(_1, false)`))),
    version(4, cat("crypto", mksimple(0xf924, 16, "RIST255_MUL", `(_1) => exec_ristretto255_mul(_1, false)`))),
    version(4, cat("crypto", mksimple(0xf925, 16, "RIST255_MULBASE", `(_1) => exec_ristretto255_mul_base(_1, false)`))),
    version(4, cat("crypto", mksimple(0xf926, 16, "RIST255_PUSHL", `exec_ristretto255_push_l`))),
    version(4, cat("crypto", mksimple(0xb7f921, 24, "RIST255_QVALIDATE", `(_1) => exec_ristretto255_validate(_1, true)`))),
    version(4, cat("crypto", mksimple(0xb7f922, 24, "RIST255_QADD", `(_1) => exec_ristretto255_add(_1, true)`))),
    version(4, cat("crypto", mksimple(0xb7f923, 24, "RIST255_QSUB", `(_1) => exec_ristretto255_sub(_1, true)`))),
    version(4, cat("crypto", mksimple(0xb7f924, 24, "RIST255_QMUL", `(_1) => exec_ristretto255_mul(_1, true)`))),
    version(4, cat("crypto", mksimple(0xb7f925, 24, "RIST255_QMULBASE", `(_1) => exec_ristretto255_mul_base(_1, true)`))),
    version(4, cat("crypto", mksimple(0xf93000, 24, "BLS_VERIFY", `exec_bls_verify`))),
    version(4, cat("crypto", mksimple(0xf93001, 24, "BLS_AGGREGATE", `exec_bls_aggregate`))),
    version(4, cat("crypto", mksimple(0xf93002, 24, "BLS_FASTAGGREGATEVERIFY", `exec_bls_fast_aggregate_verify`))),
    version(4, cat("crypto", mksimple(0xf93003, 24, "BLS_AGGREGATEVERIFY", `exec_bls_aggregate_verify`))),
    version(4, cat("crypto", mksimple(0xf93010, 24, "BLS_G1_ADD", `exec_bls_g1_add`))),
    version(4, cat("crypto", mksimple(0xf93011, 24, "BLS_G1_SUB", `exec_bls_g1_sub`))),
    version(4, cat("crypto", mksimple(0xf93012, 24, "BLS_G1_NEG", `exec_bls_g1_neg`))),
    version(4, cat("crypto", mksimple(0xf93013, 24, "BLS_G1_MUL", `exec_bls_g1_mul`))),
    version(4, cat("crypto", mksimple(0xf93014, 24, "BLS_G1_MULTIEXP", `exec_bls_g1_multiexp`))),
    version(4, cat("crypto", mksimple(0xf93015, 24, "BLS_G1_ZERO", `exec_bls_g1_zero`))),
    version(4, cat("crypto", mksimple(0xf93016, 24, "BLS_MAP_TO_G1", `exec_bls_map_to_g1`))),
    version(4, cat("crypto", mksimple(0xf93017, 24, "BLS_G1_INGROUP", `exec_bls_g1_in_group`))),
    version(4, cat("crypto", mksimple(0xf93018, 24, "BLS_G1_ISZERO", `exec_bls_g1_is_zero`))),
    version(4, cat("crypto", mksimple(0xf93020, 24, "BLS_G2_ADD", `exec_bls_g2_add`))),
    version(4, cat("crypto", mksimple(0xf93021, 24, "BLS_G2_SUB", `exec_bls_g2_sub`))),
    version(4, cat("crypto", mksimple(0xf93022, 24, "BLS_G2_NEG", `exec_bls_g2_neg`))),
    version(4, cat("crypto", mksimple(0xf93023, 24, "BLS_G2_MUL", `exec_bls_g2_mul`))),
    version(4, cat("crypto", mksimple(0xf93024, 24, "BLS_G2_MULTIEXP", `exec_bls_g2_multiexp`))),
    version(4, cat("crypto", mksimple(0xf93025, 24, "BLS_G2_ZERO", `exec_bls_g2_zero`))),
    version(4, cat("crypto", mksimple(0xf93026, 24, "BLS_MAP_TO_G2", `exec_bls_map_to_g2`))),
    version(4, cat("crypto", mksimple(0xf93027, 24, "BLS_G2_INGROUP", `exec_bls_g2_in_group`))),
    version(4, cat("crypto", mksimple(0xf93028, 24, "BLS_G2_ISZERO", `exec_bls_g2_is_zero`))),
    version(4, cat("crypto", mksimple(0xf93030, 24, "BLS_PAIRING", `exec_bls_pairing`))),
    version(4, cat("crypto", mksimple(0xf93031, 24, "BLS_PUSHR", `exec_bls_push_r`))),
    cat("misc", mksimple(0xf940, 16, "CDATASIZEQ", `(_1) => exec_compute_data_size(_1, 1)`)),
    cat("misc", mksimple(0xf941, 16, "CDATASIZE", `(_1) => exec_compute_data_size(_1, 0)`)),
    cat("misc", mksimple(0xf942, 16, "SDATASIZEQ", `(_1) => exec_compute_data_size(_1, 3)`)),
    cat("misc", mksimple(0xf943, 16, "SDATASIZE", `(_1) => exec_compute_data_size(_1, 2)`)),
    cat("address", mksimple(0xfa00, 16, "LDGRAMS", `(_1) => exec_load_var_integer(_1, 4, false, false)`)),
    cat("address", mksimple(0xfa01, 16, "LDVARINT16", `(_1) => exec_load_var_integer(_1, 4, true, false)`)),
    cat("address", mksimple(0xfa02, 16, "STGRAMS", `(_1) => exec_store_var_integer(_1, 4, false, false)`)),
    cat("address", mksimple(0xfa03, 16, "STVARINT16", `(_1) => exec_store_var_integer(_1, 4, true, false)`)),
    cat("address", mksimple(0xfa04, 16, "LDVARUINT32", `(_1) => exec_load_var_integer(_1, 5, false, false)`)),
    cat("address", mksimple(0xfa05, 16, "LDVARINT32", `(_1) => exec_load_var_integer(_1, 5, true, false)`)),
    cat("address", mksimple(0xfa06, 16, "STVARUINT32", `(_1) => exec_store_var_integer(_1, 5, false, false)`)),
    cat("address", mksimple(0xfa07, 16, "STVARINT32", `(_1) => exec_store_var_integer(_1, 5, true, false)`)),
    cat("address", mksimple(0xfa40, 16, "LDMSGADDR", `(_1) => exec_load_message_addr(_1, false)`)),
    cat("address", mksimple(0xfa41, 16, "LDMSGADDRQ", `(_1) => exec_load_message_addr(_1, true)`)),
    cat("address", mksimple(0xfa42, 16, "PARSEMSGADDR", `(_1) => exec_parse_message_addr(_1, false)`)),
    cat("address", mksimple(0xfa43, 16, "PARSEMSGADDRQ", `(_1) => exec_parse_message_addr(_1, true)`)),
    cat("address", mksimple(0xfa44, 16, "REWRITESTDADDR", `(_1) => exec_rewrite_message_addr(_1, false, false)`)),
    cat("address", mksimple(0xfa45, 16, "REWRITESTDADDRQ", `(_1) => exec_rewrite_message_addr(_1, false, true)`)),
    cat("address", mksimple(0xfa46, 16, "REWRITEVARADDR", `(_1) => exec_rewrite_message_addr(_1, true, false)`)),
    cat("address", mksimple(0xfa47, 16, "REWRITEVARADDRQ", `(_1) => exec_rewrite_message_addr(_1, true, true)`)),
    cat("message", mksimple(0xfb00, 16, "SENDRAWMSG", `exec_send_raw_message`)),
    cat("message", mksimple(0xfb02, 16, "RAWRESERVE", `(_1) => exec_reserve_raw(_1, 0)`)),
    cat("message", mksimple(0xfb03, 16, "RAWRESERVEX", `(_1) => exec_reserve_raw(_1, 1)`)),
    cat("message", mksimple(0xfb04, 16, "SETCODE", `exec_set_code`)),
    cat("message", mksimple(0xfb06, 16, "SETLIBCODE", `exec_set_lib_code`)),
    cat("message", mksimple(0xfb07, 16, "CHANGELIB", `exec_change_lib`)),
    version(4, cat("message", mksimple(0xfb08, 16, "SENDMSG", `exec_send_message`))),
    cat("tuple", mksimple(0x6d, 8, "PUSHNULL", `exec_push_null`)),
    cat("tuple", mksimple(0x6e, 8, "ISNULL", `exec_is_null`)),
    cat("tuple", mksimple(0x6f80, 16, "TUPLEVAR", `exec_mktuple_var`)),
    cat("tuple", mksimple(0x6f81, 16, "INDEXVAR", `exec_tuple_index_var`)),
    cat("tuple", mksimple(0x6f82, 16, "UNTUPLEVAR", `exec_untuple_var`)),
    cat("tuple", mksimple(0x6f83, 16, "UNPACKFIRSTVAR", `exec_untuple_first_var`)),
    cat("tuple", mksimple(0x6f84, 16, "EXPLODEVAR", `exec_explode_tuple_var`)),
    cat("tuple", mksimple(0x6f85, 16, "SETINDEXVAR", `exec_tuple_set_index_var`)),
    cat("tuple", mksimple(0x6f86, 16, "INDEXVARQ", `exec_tuple_quiet_index_var`)),
    cat("tuple", mksimple(0x6f87, 16, "SETINDEXVARQ", `exec_tuple_quiet_set_index_var`)),
    cat("tuple", mksimple(0x6f88, 16, "TLEN", `exec_tuple_length`)),
    cat("tuple", mksimple(0x6f89, 16, "QTLEN", `exec_tuple_length_quiet`)),
    cat("tuple", mksimple(0x6f8a, 16, "ISTUPLE", `exec_is_tuple`)),
    cat("tuple", mksimple(0x6f8b, 16, "LAST", `exec_tuple_last`)),
    cat("tuple", mksimple(0x6f8c, 16, "TPUSH", `exec_tuple_push`)),
    cat("tuple", mksimple(0x6f8d, 16, "TPOP", `exec_tuple_pop`)),
    cat("tuple", mksimple(0x6fa0, 16, "NULLSWAPIF", `(_1) => exec_null_swap_if(_1, true, 0)`)),
    cat("tuple", mksimple(0x6fa1, 16, "NULLSWAPIFNOT", `(_1) => exec_null_swap_if(_1, false, 0)`)),
    cat("tuple", mksimple(0x6fa2, 16, "NULLROTRIF", `(_1) => exec_null_swap_if(_1, true, 1)`)),
    cat("tuple", mksimple(0x6fa3, 16, "NULLROTRIFNOT", `(_1) => exec_null_swap_if(_1, false, 1)`)),
    cat("tuple", mksimple(0x6fa4, 16, "NULLSWAPIF2", `(_1) => exec_null_swap_if_many(_1, true, 0, 2)`)),
    cat("tuple", mksimple(0x6fa5, 16, "NULLSWAPIFNOT2", `(_1) => exec_null_swap_if_many(_1, false, 0, 2)`)),
    cat("tuple", mksimple(0x6fa6, 16, "NULLROTRIF2", `(_1) => exec_null_swap_if_many(_1, true, 1, 2)`)),
    cat("tuple", mksimple(0x6fa7, 16, "NULLROTRIFNOT2", `(_1) => exec_null_swap_if_many(_1, false, 1, 2)`)),
    version(4, cat("div", mksimple(0xa900, 16, "ADDDIVMOD", `(_1, _2) => exec_divmod(_1, _2, false)`))),
    version(4, cat("div", mksimple(0xa901, 16, "ADDDIVMODR", `(_1, _2) => exec_divmod(_1, _2, false)`))),
    version(4, cat("div", mksimple(0xa902, 16, "ADDDIVMODC", `(_1, _2) => exec_divmod(_1, _2, false)`))),
    cat("div", mksimple(0xa904, 16, "DIV", `(_1, _2) => exec_divmod(_1, _2, false)`)),
    cat("div", mksimple(0xa905, 16, "DIVR", `(_1, _2) => exec_divmod(_1, _2, false)`)),
    cat("div", mksimple(0xa906, 16, "DIVC", `(_1, _2) => exec_divmod(_1, _2, false)`)),
    cat("div", mksimple(0xa908, 16, "MOD", `(_1, _2) => exec_divmod(_1, _2, false)`)),
    cat("div", mksimple(0xa909, 16, "MODR", `(_1, _2) => exec_divmod(_1, _2, false)`)),
    cat("div", mksimple(0xa90a, 16, "MODC", `(_1, _2) => exec_divmod(_1, _2, false)`)),
    cat("div", mksimple(0xa90c, 16, "DIVMOD", `(_1, _2) => exec_divmod(_1, _2, false)`)),
    cat("div", mksimple(0xa90d, 16, "DIVMODR", `(_1, _2) => exec_divmod(_1, _2, false)`)),
    cat("div", mksimple(0xa90e, 16, "DIVMODC", `(_1, _2) => exec_divmod(_1, _2, false)`)),
    version(4, cat("div", mksimple(0xb7a900, 24, "QADDDIVMOD", `(_1, _2) => exec_divmod(_1, _2, true)`))),
    version(4, cat("div", mksimple(0xb7a901, 24, "QADDDIVMODR", `(_1, _2) => exec_divmod(_1, _2, true)`))),
    version(4, cat("div", mksimple(0xb7a902, 24, "QADDDIVMODC", `(_1, _2) => exec_divmod(_1, _2, true)`))),
    cat("div", mksimple(0xb7a904, 24, "QDIV", `(_1, _2) => exec_divmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a905, 24, "QDIVR", `(_1, _2) => exec_divmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a906, 24, "QDIVC", `(_1, _2) => exec_divmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a908, 24, "QMOD", `(_1, _2) => exec_divmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a909, 24, "QMODR", `(_1, _2) => exec_divmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a90a, 24, "QMODC", `(_1, _2) => exec_divmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a90c, 24, "QDIVMOD", `(_1, _2) => exec_divmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a90d, 24, "QDIVMODR", `(_1, _2) => exec_divmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a90e, 24, "QDIVMODC", `(_1, _2) => exec_divmod(_1, _2, true)`)),
    version(4, cat("div", cat("div", mksimple(0xa920, 16, "ADDRSHIFTMOD", `(_1, _2) => exec_shrmod(_1, _2, 0)`)))),
    version(4, cat("div", cat("div", mksimple(0xa921, 16, "ADDRSHIFTMODR", `(_1, _2) => exec_shrmod(_1, _2, 0)`)))),
    version(4, cat("div", cat("div", mksimple(0xa922, 16, "ADDRSHIFTMODC", `(_1, _2) => exec_shrmod(_1, _2, 0)`)))),
    cat("div", mksimple(0xa924, 16, "RSHIFT", `(_1, _2) => exec_shrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa925, 16, "RSHIFTR", `(_1, _2) => exec_shrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa926, 16, "RSHIFTC", `(_1, _2) => exec_shrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa928, 16, "MODPOW2", `(_1, _2) => exec_shrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa929, 16, "MODPOW2R", `(_1, _2) => exec_shrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa92a, 16, "MODPOW2C", `(_1, _2) => exec_shrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa92c, 16, "RSHIFTMOD", `(_1, _2) => exec_shrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa92d, 16, "RSHIFTMODR", `(_1, _2) => exec_shrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa92e, 16, "RSHIFTMODC", `(_1, _2) => exec_shrmod(_1, _2, 0)`)),
    version(4, cat("div", mksimple(0xb7a920, 24, "QADDRSHIFTMOD", `(_1, _2) => exec_shrmod(_1, _2, 1)`))),
    version(4, cat("div", mksimple(0xb7a921, 24, "QADDRSHIFTMODR", `(_1, _2) => exec_shrmod(_1, _2, 1)`))),
    version(4, cat("div", mksimple(0xb7a922, 24, "QADDRSHIFTMODC", `(_1, _2) => exec_shrmod(_1, _2, 1)`))),
    cat("div", mksimple(0xb7a924, 24, "QRSHIFT", `(_1, _2) => exec_shrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a925, 24, "QRSHIFTR", `(_1, _2) => exec_shrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a926, 24, "QRSHIFTC", `(_1, _2) => exec_shrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a928, 24, "QMODPOW2", `(_1, _2) => exec_shrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a929, 24, "QMODPOW2R", `(_1, _2) => exec_shrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a92a, 24, "QMODPOW2C", `(_1, _2) => exec_shrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a92c, 24, "QRSHIFTMOD", `(_1, _2) => exec_shrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a92d, 24, "QRSHIFTMODR", `(_1, _2) => exec_shrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a92e, 24, "QRSHIFTMODC", `(_1, _2) => exec_shrmod(_1, _2, 1)`)),
    version(4, cat("div", mksimple(0xa980, 16, "MULADDDIVMOD", `(_1, _2) => exec_muldivmod(_1, _2, false)`))),
    version(4, cat("div", mksimple(0xa981, 16, "MULADDDIVMODR", `(_1, _2) => exec_muldivmod(_1, _2, false)`))),
    version(4, cat("div", mksimple(0xa982, 16, "MULADDDIVMODC", `(_1, _2) => exec_muldivmod(_1, _2, false)`))),
    cat("div", mksimple(0xa984, 16, "MULDIV", `(_1, _2) => exec_muldivmod(_1, _2, false)`)),
    cat("div", mksimple(0xa985, 16, "MULDIVR", `(_1, _2) => exec_muldivmod(_1, _2, false)`)),
    cat("div", mksimple(0xa986, 16, "MULDIVC", `(_1, _2) => exec_muldivmod(_1, _2, false)`)),
    cat("div", mksimple(0xa988, 16, "MULMOD", `(_1, _2) => exec_muldivmod(_1, _2, false)`)),
    cat("div", mksimple(0xa989, 16, "MULMODR", `(_1, _2) => exec_muldivmod(_1, _2, false)`)),
    cat("div", mksimple(0xa98a, 16, "MULMODC", `(_1, _2) => exec_muldivmod(_1, _2, false)`)),
    cat("div", mksimple(0xa98c, 16, "MULDIVMOD", `(_1, _2) => exec_muldivmod(_1, _2, false)`)),
    cat("div", mksimple(0xa98d, 16, "MULDIVMODR", `(_1, _2) => exec_muldivmod(_1, _2, false)`)),
    cat("div", mksimple(0xa98e, 16, "MULDIVMODC", `(_1, _2) => exec_muldivmod(_1, _2, false)`)),
    version(4, cat("div", mksimple(0xb7a980, 24, "QMULADDDIVMOD", `(_1, _2) => exec_muldivmod(_1, _2, true)`))),
    version(4, cat("div", mksimple(0xb7a981, 24, "QMULADDDIVMODR", `(_1, _2) => exec_muldivmod(_1, _2, true)`))),
    version(4, cat("div", mksimple(0xb7a982, 24, "QMULADDDIVMODC", `(_1, _2) => exec_muldivmod(_1, _2, true)`))),
    cat("div", mksimple(0xb7a984, 24, "QMULDIV", `(_1, _2) => exec_muldivmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a985, 24, "QMULDIVR", `(_1, _2) => exec_muldivmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a986, 24, "QMULDIVC", `(_1, _2) => exec_muldivmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a988, 24, "QMULMOD", `(_1, _2) => exec_muldivmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a989, 24, "QMULMODR", `(_1, _2) => exec_muldivmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a98a, 24, "QMULMODC", `(_1, _2) => exec_muldivmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a98c, 24, "QMULDIVMOD", `(_1, _2) => exec_muldivmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a98d, 24, "QMULDIVMODR", `(_1, _2) => exec_muldivmod(_1, _2, true)`)),
    cat("div", mksimple(0xb7a98e, 24, "QMULDIVMODC", `(_1, _2) => exec_muldivmod(_1, _2, true)`)),
    version(4, cat("div", mksimple(0xa9a0, 16, "MULADDRSHIFTMOD", `(_1, _2) => exec_mulshrmod(_1, _2, 0)`))),
    version(4, cat("div", mksimple(0xa9a1, 16, "MULADDRSHIFTRMOD", `(_1, _2) => exec_mulshrmod(_1, _2, 0)`))),
    version(4, cat("div", mksimple(0xa9a2, 16, "MULADDRSHIFTCMOD", `(_1, _2) => exec_mulshrmod(_1, _2, 0)`))),
    cat("div", mksimple(0xa9a4, 16, "MULRSHIFT", `(_1, _2) => exec_mulshrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9a5, 16, "MULRSHIFTR", `(_1, _2) => exec_mulshrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9a6, 16, "MULRSHIFTC", `(_1, _2) => exec_mulshrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9a8, 16, "MULMODPOW2", `(_1, _2) => exec_mulshrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9a9, 16, "MULMODPOW2R", `(_1, _2) => exec_mulshrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9aa, 16, "MULMODPOW2C", `(_1, _2) => exec_mulshrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9ac, 16, "MULRSHIFTMOD", `(_1, _2) => exec_mulshrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9ad, 16, "MULRSHIFTRMOD", `(_1, _2) => exec_mulshrmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9ae, 16, "MULRSHIFTCMOD", `(_1, _2) => exec_mulshrmod(_1, _2, 0)`)),
    version(4, cat("div", mksimple(0xb7a9a0, 24, "QMULADDRSHIFTMOD", `(_1, _2) => exec_mulshrmod(_1, _2, 1)`))),
    version(4, cat("div", mksimple(0xb7a9a1, 24, "QMULADDRSHIFTRMOD", `(_1, _2) => exec_mulshrmod(_1, _2, 1)`))),
    version(4, cat("div", mksimple(0xb7a9a2, 24, "QMULADDRSHIFTCMOD", `(_1, _2) => exec_mulshrmod(_1, _2, 1)`))),
    cat("div", mksimple(0xb7a9a4, 24, "QMULRSHIFT", `(_1, _2) => exec_mulshrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9a5, 24, "QMULRSHIFTR", `(_1, _2) => exec_mulshrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9a6, 24, "QMULRSHIFTC", `(_1, _2) => exec_mulshrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9a8, 24, "QMULMODPOW2", `(_1, _2) => exec_mulshrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9a9, 24, "QMULMODPOW2R", `(_1, _2) => exec_mulshrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9aa, 24, "QMULMODPOW2C", `(_1, _2) => exec_mulshrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9ac, 24, "QMULRSHIFTMOD", `(_1, _2) => exec_mulshrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9ad, 24, "QMULRSHIFTRMOD", `(_1, _2) => exec_mulshrmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9ae, 24, "QMULRSHIFTCMOD", `(_1, _2) => exec_mulshrmod(_1, _2, 1)`)),
    version(4, cat("div", mksimple(0xa9c0, 16, "LSHIFTADDDIVMOD", `(_1, _2) => exec_shldivmod(_1, _2, 0)`))),
    version(4, cat("div", mksimple(0xa9c1, 16, "LSHIFTADDDIVMODR", `(_1, _2) => exec_shldivmod(_1, _2, 0)`))),
    version(4, cat("div", mksimple(0xa9c2, 16, "LSHIFTADDDIVMODC", `(_1, _2) => exec_shldivmod(_1, _2, 0)`))),
    cat("div", mksimple(0xa9c4, 16, "LSHIFTDIV", `(_1, _2) => exec_shldivmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9c5, 16, "LSHIFTDIVR", `(_1, _2) => exec_shldivmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9c6, 16, "LSHIFTDIVC", `(_1, _2) => exec_shldivmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9c8, 16, "LSHIFTMOD", `(_1, _2) => exec_shldivmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9c9, 16, "LSHIFTMODR", `(_1, _2) => exec_shldivmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9ca, 16, "LSHIFTMODC", `(_1, _2) => exec_shldivmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9cc, 16, "LSHIFTDIVMOD", `(_1, _2) => exec_shldivmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9cd, 16, "LSHIFTDIVMODR", `(_1, _2) => exec_shldivmod(_1, _2, 0)`)),
    cat("div", mksimple(0xa9ce, 16, "LSHIFTDIVMODC", `(_1, _2) => exec_shldivmod(_1, _2, 0)`)),
    version(4, cat("div", mksimple(0xb7a9c0, 24, "QLSHIFTADDDIVMOD", `(_1, _2) => exec_shldivmod(_1, _2, 1)`))),
    version(4, cat("div", mksimple(0xb7a9c1, 24, "QLSHIFTADDDIVMODR", `(_1, _2) => exec_shldivmod(_1, _2, 1)`))),
    version(4, cat("div", mksimple(0xb7a9c2, 24, "QLSHIFTADDDIVMODC", `(_1, _2) => exec_shldivmod(_1, _2, 1)`))),
    cat("div", mksimple(0xb7a9c4, 24, "QLSHIFTDIV", `(_1, _2) => exec_shldivmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9c5, 24, "QLSHIFTDIVR", `(_1, _2) => exec_shldivmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9c6, 24, "QLSHIFTDIVC", `(_1, _2) => exec_shldivmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9c8, 24, "QLSHIFTMOD", `(_1, _2) => exec_shldivmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9c9, 24, "QLSHIFTMODR", `(_1, _2) => exec_shldivmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9ca, 24, "QLSHIFTMODC", `(_1, _2) => exec_shldivmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9cc, 24, "QLSHIFTDIVMOD", `(_1, _2) => exec_shldivmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9cd, 24, "QLSHIFTDIVMODR", `(_1, _2) => exec_shldivmod(_1, _2, 1)`)),
    cat("div", mksimple(0xb7a9ce, 24, "QLSHIFTDIVMODC", `(_1, _2) => exec_shldivmod(_1, _2, 1)`)),
    cat("cell_serialize", mksimple(0xcf00, 16, "STIX", `exec_store_int_var`)),
    cat("cell_serialize", mksimple(0xcf01, 16, "STUX", `exec_store_int_var`)),
    cat("cell_serialize", mksimple(0xcf02, 16, "STIXR", `exec_store_int_var`)),
    cat("cell_serialize", mksimple(0xcf03, 16, "STUXR", `exec_store_int_var`)),
    cat("cell_serialize", mksimple(0xcf04, 16, "STIXQ", `exec_store_int_var`)),
    cat("cell_serialize", mksimple(0xcf05, 16, "STUXQ", `exec_store_int_var`)),
    cat("cell_serialize", mksimple(0xcf06, 16, "STIXRQ", `exec_store_int_var`)),
    cat("cell_serialize", mksimple(0xcf07, 16, "STUXRQ", `exec_store_int_var`)),
    cat("cell_serialize", mksimple(0xcf28, 16, "STILE4", `exec_store_le_int`)),
    cat("cell_serialize", mksimple(0xcf29, 16, "STULE4", `exec_store_le_int`)),
    cat("cell_serialize", mksimple(0xcf2a, 16, "STILE8", `exec_store_le_int`)),
    cat("cell_serialize", mksimple(0xcf2b, 16, "STULE8", `exec_store_le_int`)),
    cat("cell_deserialize", mksimple(0xd700, 16, "LDIX", `exec_load_int_var`)),
    cat("cell_deserialize", mksimple(0xd701, 16, "LDUX", `exec_load_int_var`)),
    cat("cell_deserialize", mksimple(0xd702, 16, "PLDIX", `exec_load_int_var`)),
    cat("cell_deserialize", mksimple(0xd703, 16, "PLDUX", `exec_load_int_var`)),
    cat("cell_deserialize", mksimple(0xd704, 16, "LDIXQ", `exec_load_int_var`)),
    cat("cell_deserialize", mksimple(0xd705, 16, "LDUXQ", `exec_load_int_var`)),
    cat("cell_deserialize", mksimple(0xd706, 16, "PLDIXQ", `exec_load_int_var`)),
    cat("cell_deserialize", mksimple(0xd707, 16, "PLDUXQ", `exec_load_int_var`)),
    cat("cell_deserialize", mksimple(0xd718, 16, "LDSLICEX", `exec_load_slice`)),
    cat("cell_deserialize", mksimple(0xd719, 16, "PLDSLICEX", `exec_load_slice`)),
    cat("cell_deserialize", mksimple(0xd71a, 16, "LDSLICEXQ", `exec_load_slice`)),
    cat("cell_deserialize", mksimple(0xd71b, 16, "PLDSLICEXQ", `exec_load_slice`)),
    cat("cell_deserialize", mksimple(0xd750, 16, "LDILE4", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd751, 16, "LDULE4", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd752, 16, "LDILE8", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd753, 16, "LDULE8", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd754, 16, "PLDILE4", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd755, 16, "PLDULE4", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd756, 16, "PLDILE8", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd757, 16, "PLDULE8", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd758, 16, "LDILE4Q", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd759, 16, "LDULE4Q", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd75a, 16, "LDILE8Q", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd75b, 16, "LDULE8Q", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd75c, 16, "PLDILE4Q", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd75d, 16, "PLDULE4Q", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd75e, 16, "PLDILE8Q", `exec_load_le_int`)),
    cat("cell_deserialize", mksimple(0xd75f, 16, "PLDULE8Q", `exec_load_le_int`)),
    cat("dictionary", mksimple(0xf4a0, 16, "DICTIGETJMP", `exec_dict_get_exec`)),
    cat("dictionary", mksimple(0xf4a1, 16, "DICTUGETJMP", `exec_dict_get_exec`)),
    cat("dictionary", mksimple(0xf4a2, 16, "DICTIGETEXEC", `exec_dict_get_exec`)),
    cat("dictionary", mksimple(0xf4a3, 16, "DICTUGETEXEC", `exec_dict_get_exec`)),
    cat("dictionary", mksimple(0xf4bc, 16, "DICTIGETJMPZ", `exec_dict_get_exec`)),
    cat("dictionary", mksimple(0xf4bd, 16, "DICTUGETJMPZ", `exec_dict_get_exec`)),
    cat("dictionary", mksimple(0xf4be, 16, "DICTIGETEXECZ", `exec_dict_get_exec`)),
    cat("dictionary", mksimple(0xf4bf, 16, "DICTUGETEXECZ", `exec_dict_get_exec`)),
    cat("dictionary", mksimple(0xf40a, 16, "DICTGET", "exec_dict_get")),
    cat("dictionary", mksimple(0xf40b, 16, "DICTGETREF", "exec_dict_get")),
    cat("dictionary", mksimple(0xf40c, 16, "DICTIGET", "exec_dict_get")),
    cat("dictionary", mksimple(0xf40d, 16, "DICTIGETREF", "exec_dict_get")),
    cat("dictionary", mksimple(0xf40e, 16, "DICTUGET", "exec_dict_get")),
    cat("dictionary", mksimple(0xf40f, 16, "DICTUGETREF", "exec_dict_get")),
    cat("dictionary", mksimple(0xf412, 16, "DICTSET", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Set, \"SET\", false)")),
    cat("dictionary", mksimple(0xf413, 16, "DICTSETREF", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Set, \"SET\", false)")),
    cat("dictionary", mksimple(0xf414, 16, "DICTISET", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Set, \"SET\", false)")),
    cat("dictionary", mksimple(0xf415, 16, "DICTISETREF", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Set, \"SET\", false)")),
    cat("dictionary", mksimple(0xf416, 16, "DICTUSET", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Set, \"SET\", false)")),
    cat("dictionary", mksimple(0xf417, 16, "DICTUSETREF", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Set, \"SET\", false)")),
    cat("dictionary", mksimple(0xf41a, 16, "DICTSETGET", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Set, \"SETGET\", false)")),
    cat("dictionary", mksimple(0xf41b, 16, "DICTSETGETREF", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Set, \"SETGET\", false)")),
    cat("dictionary", mksimple(0xf41c, 16, "DICTISETGET", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Set, \"SETGET\", false)")),
    cat("dictionary", mksimple(0xf41d, 16, "DICTISETGETREF", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Set, \"SETGET\", false)")),
    cat("dictionary", mksimple(0xf41e, 16, "DICTUSETGET", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Set, \"SETGET\", false)")),
    cat("dictionary", mksimple(0xf41f, 16, "DICTUSETGETREF", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Set, \"SETGET\", false)")),
    cat("dictionary", mksimple(0xf422, 16, "DICTREPLACE", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Replace, \"REPLACE\", false)")),
    cat("dictionary", mksimple(0xf423, 16, "DICTREPLACEREF", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Replace, \"REPLACE\", false)")),
    cat("dictionary", mksimple(0xf424, 16, "DICTIREPLACE", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Replace, \"REPLACE\", false)")),
    cat("dictionary", mksimple(0xf425, 16, "DICTIREPLACEREF", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Replace, \"REPLACE\", false)")),
    cat("dictionary", mksimple(0xf426, 16, "DICTUREPLACE", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Replace, \"REPLACE\", false)")),
    cat("dictionary", mksimple(0xf427, 16, "DICTUREPLACEREF", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Replace, \"REPLACE\", false)")),
    cat("dictionary", mksimple(0xf42a, 16, "DICTREPLACEGET", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Replace, \"REPLACEGET\", false)")),
    cat("dictionary", mksimple(0xf42b, 16, "DICTREPLACEGETREF", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Replace, \"REPLACEGET\", false)")),
    cat("dictionary", mksimple(0xf42c, 16, "DICTIREPLACEGET", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Replace, \"REPLACEGET\", false)")),
    cat("dictionary", mksimple(0xf42d, 16, "DICTIREPLACEGETREF", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Replace, \"REPLACEGET\", false)")),
    cat("dictionary", mksimple(0xf42e, 16, "DICTUREPLACEGET", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Replace, \"REPLACEGET\", false)")),
    cat("dictionary", mksimple(0xf42f, 16, "DICTUREPLACEGETREF", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Replace, \"REPLACEGET\", false)")),
    cat("dictionary", mksimple(0xf432, 16, "DICTADD", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Add, \"ADD\", false)")),
    cat("dictionary", mksimple(0xf433, 16, "DICTADDREF", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Add, \"ADD\", false)")),
    cat("dictionary", mksimple(0xf434, 16, "DICTIADD", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Add, \"ADD\", false)")),
    cat("dictionary", mksimple(0xf435, 16, "DICTIADDREF", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Add, \"ADD\", false)")),
    cat("dictionary", mksimple(0xf436, 16, "DICTUADD", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Add, \"ADD\", false)")),
    cat("dictionary", mksimple(0xf437, 16, "DICTUADDREF", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Add, \"ADD\", false)")),
    cat("dictionary", mksimple(0xf43a, 16, "DICTADDGET", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Add, \"ADDGET\", false)")),
    cat("dictionary", mksimple(0xf43b, 16, "DICTADDGETREF", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Add, \"ADDGET\", false)")),
    cat("dictionary", mksimple(0xf43c, 16, "DICTIADDGET", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Add, \"ADDGET\", false)")),
    cat("dictionary", mksimple(0xf43d, 16, "DICTIADDGETREF", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Add, \"ADDGET\", false)")),
    cat("dictionary", mksimple(0xf43e, 16, "DICTUADDGET", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Add, \"ADDGET\", false)")),
    cat("dictionary", mksimple(0xf43f, 16, "DICTUADDGETREF", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Add, \"ADDGET\", false)")),
    cat("dictionary", mksimple(0xf462, 16, "DICTDELGET", "exec_dict_deleteget")),
    cat("dictionary", mksimple(0xf463, 16, "DICTDELGETREF", "exec_dict_deleteget")),
    cat("dictionary", mksimple(0xf464, 16, "DICTIDELGET", "exec_dict_deleteget")),
    cat("dictionary", mksimple(0xf465, 16, "DICTIDELGETREF", "exec_dict_deleteget")),
    cat("dictionary", mksimple(0xf466, 16, "DICTUDELGET", "exec_dict_deleteget")),
    cat("dictionary", mksimple(0xf467, 16, "DICTUDELGETREF", "exec_dict_deleteget")),
    cat("dictionary", mksimple(0xf482, 16, "DICTMIN", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf483, 16, "DICTMINREF", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf484, 16, "DICTIMIN", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf485, 16, "DICTIMINREF", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf486, 16, "DICTUMIN", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf487, 16, "DICTUMINREF", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf48a, 16, "DICTMAX", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf48b, 16, "DICTMAXREF", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf48c, 16, "DICTIMAX", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf48d, 16, "DICTIMAXREF", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf48e, 16, "DICTUMAX", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf48f, 16, "DICTUMAXREF", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf492, 16, "DICTREMMIN", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf493, 16, "DICTREMMINREF", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf494, 16, "DICTIREMMIN", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf495, 16, "DICTIREMMINREF", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf496, 16, "DICTUREMMIN", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf497, 16, "DICTUREMMINREF", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf49a, 16, "DICTREMMAX", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf49b, 16, "DICTREMMAXREF", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf49c, 16, "DICTIREMMAX", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf49d, 16, "DICTIREMMAXREF", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf49e, 16, "DICTUREMMAX", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf49f, 16, "DICTUREMMAXREF", "exec_dict_getmin")),
    cat("dictionary", mksimple(0xf441, 16, "DICTSETB", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Set, \"SET\", true)")),
    cat("dictionary", mksimple(0xf442, 16, "DICTISETB", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Set, \"SET\", true)")),
    cat("dictionary", mksimple(0xf443, 16, "DICTUSETB", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Set, \"SET\", true)")),
    cat("dictionary", mksimple(0xf445, 16, "DICTSETGETB", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Set, \"SETGET\", true)")),
    cat("dictionary", mksimple(0xf446, 16, "DICTISETGETB", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Set, \"SETGET\", true)")),
    cat("dictionary", mksimple(0xf447, 16, "DICTUSETGETB", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Set, \"SETGET\", true)")),
    cat("dictionary", mksimple(0xf449, 16, "DICTREPLACEB", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Replace, \"REPLACE\", true)")),
    cat("dictionary", mksimple(0xf44a, 16, "DICTIREPLACEB", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Replace, \"REPLACE\", true)")),
    cat("dictionary", mksimple(0xf44b, 16, "DICTUREPLACEB", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Replace, \"REPLACE\", true)")),
    cat("dictionary", mksimple(0xf44d, 16, "DICTREPLACEGETB", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Replace, \"REPLACEGET\", true)")),
    cat("dictionary", mksimple(0xf44e, 16, "DICTIREPLACEGETB", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Replace, \"REPLACEGET\", true)")),
    cat("dictionary", mksimple(0xf44f, 16, "DICTUREPLACEGETB", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Replace, \"REPLACEGET\", true)")),
    cat("dictionary", mksimple(0xf451, 16, "DICTADDB", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Add, \"ADD\", true)")),
    cat("dictionary", mksimple(0xf452, 16, "DICTIADDB", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Add, \"ADD\", true)")),
    cat("dictionary", mksimple(0xf453, 16, "DICTUADDB", "(_1, _2) => exec_dict_set(_1, _2, SetMode.Add, \"ADD\", true)")),
    cat("dictionary", mksimple(0xf455, 16, "DICTADDGETB", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Add, \"ADDGET\", true)")),
    cat("dictionary", mksimple(0xf456, 16, "DICTIADDGETB", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Add, \"ADDGET\", true)")),
    cat("dictionary", mksimple(0xf457, 16, "DICTUADDGETB", "(_1, _2) => exec_dict_setget(_1, _2, SetMode.Add, \"ADDGET\", true)")),
    cat("dictionary", mksimple(0xf459, 16, "DICTDEL", "exec_dict_delete")),
    cat("dictionary", mksimple(0xf45a, 16, "DICTIDEL", "exec_dict_delete")),
    cat("dictionary", mksimple(0xf45b, 16, "DICTUDEL", "exec_dict_delete")),
    cat("dictionary", mksimple(0xf469, 16, "DICTGETOPTREF", "exec_dict_get_optref")),
    cat("dictionary", mksimple(0xf46a, 16, "DICTIGETOPTREF", "exec_dict_get_optref")),
    cat("dictionary", mksimple(0xf46b, 16, "DICTUGETOPTREF", "exec_dict_get_optref")),
    cat("dictionary", mksimple(0xf46d, 16, "DICTSETGETOPTREF", "exec_dict_setget_optref")),
    cat("dictionary", mksimple(0xf46e, 16, "DICTISETGETOPTREF", "exec_dict_setget_optref")),
    cat("dictionary", mksimple(0xf46f, 16, "DICTUSETGETOPTREF", "exec_dict_setget_optref")),
    cat("dictionary", mksimple(0xf4b1, 16, "SUBDICTGET", "exec_subdict_get")),
    cat("dictionary", mksimple(0xf4b2, 16, "SUBDICTIGET", "exec_subdict_get")),
    cat("dictionary", mksimple(0xf4b3, 16, "SUBDICTUGET", "exec_subdict_get")),
    cat("dictionary", mksimple(0xf4b5, 16, "SUBDICTRPGET", "exec_subdict_get")),
    cat("dictionary", mksimple(0xf4b6, 16, "SUBDICTIRPGET", "exec_subdict_get")),
    cat("dictionary", mksimple(0xf4b7, 16, "SUBDICTURPGET", "exec_subdict_get")),
    cat("exception", mksimple(0xf2f0, 16, "THROWANY", `exec_throw_any`)),
    cat("exception", mksimple(0xf2f1, 16, "THROWARGANY", `exec_throw_any`)),
    cat("exception", mksimple(0xf2f2, 16, "THROWANYIF", `exec_throw_any`)),
    cat("exception", mksimple(0xf2f3, 16, "THROWARGANYIF", `exec_throw_any`)),
    cat("exception", mksimple(0xf2f4, 16, "THROWANYIFNOT", `exec_throw_any`)),
    cat("exception", mksimple(0xf2f5, 16, "THROWARGANYIFNOT", `exec_throw_any`)),
    cat("exception", mksimple(0xf2f6, 16, "THROWANYIF", `exec_throw_any`)),
    cat("exception", mksimple(0xf2f7, 16, "THROWARGANYIF", `exec_throw_any`)),
    cat("dictionary", mksimple(0xf474, 16, "DICTGETNEXT", `exec_dict_getnear`)),
    cat("dictionary", mksimple(0xf475, 16, "DICTGETNEXTEQ", `exec_dict_getnear`)),
    cat("dictionary", mksimple(0xf476, 16, "DICTGETPREV", `exec_dict_getnear`)),
    cat("dictionary", mksimple(0xf477, 16, "DICTGETPREVEQ", `exec_dict_getnear`)),
    cat("dictionary", mksimple(0xf478, 16, "DICTIGETNEXT", `exec_dict_getnear`)),
    cat("dictionary", mksimple(0xf479, 16, "DICTIGETNEXTEQ", `exec_dict_getnear`)),
    cat("dictionary", mksimple(0xf47a, 16, "DICTIGETPREV", `exec_dict_getnear`)),
    cat("dictionary", mksimple(0xf47b, 16, "DICTIGETPREVEQ", `exec_dict_getnear`)),
    cat("dictionary", mksimple(0xf47c, 16, "DICTUGETNEXT", `exec_dict_getnear`)),
    cat("dictionary", mksimple(0xf47d, 16, "DICTUGETNEXTEQ", `exec_dict_getnear`)),
    cat("dictionary", mksimple(0xf47e, 16, "DICTUGETPREV", `exec_dict_getnear`)),
    cat("dictionary", mksimple(0xf47f, 16, "DICTUGETPREVEQ", `exec_dict_getnear`)),

    cat("add_mul", mkfixedn(0xa6, 8, 8, "ADDINT", seq1(int(8)), `(_1, _2) => exec_add_tinyint8(_1, _2, false)`)),
    cat("add_mul", mkfixedn(0xa7, 8, 8, "MULINT", seq1(int(8)), `(_1, _2) => exec_mul_tinyint8(_1, _2, false)`)),
    cat("add_mul", mkfixedn(0xb7a6, 16, 8, "QADDINT", seq1(int(8)), `(_1, _2) => exec_add_tinyint8(_1, _2, true)`)),
    cat("add_mul", mkfixedn(0xb7a7, 16, 8, "QMULINT", seq1(int(8)), `(_1, _2) => exec_mul_tinyint8(_1, _2, true)`)),
    cat("int_cmp", mkfixedn(0xc0, 8, 8, "EQINT", seq1(int(8)), `(_1, _2) => exec_cmp_int(_1, _2, 0x878, false, "EQ")`)),
    cat("int_cmp", mkfixedn(0xc1, 8, 8, "LESSINT", seq1(int(8)), `(_1, _2) => exec_cmp_int(_1, _2, 0x887, false, "LESS")`)),
    cat("int_cmp", mkfixedn(0xc2, 8, 8, "GTINT", seq1(int(8)), `(_1, _2) => exec_cmp_int(_1, _2, 0x788, false, "GT")`)),
    cat("int_cmp", mkfixedn(0xc3, 8, 8, "NEQINT", seq1(int(8)), `(_1, _2) => exec_cmp_int(_1, _2, 0x787, false, "NEQ")`)),
    cat("int_cmp", mkfixedn(0xb7c0, 16, 8, "QEQINT", seq1(int(8)), `(_1, _2) => exec_cmp_int(_1, _2, 0x878, true, "QEQ")`)),
    cat("int_cmp", mkfixedn(0xb7c1, 16, 8, "QLESSINT", seq1(int(8)), `(_1, _2) => exec_cmp_int(_1, _2, 0x887, true, "QLESS")`)),
    cat("int_cmp", mkfixedn(0xb7c2, 16, 8, "QGTINT", seq1(int(8)), `(_1, _2) => exec_cmp_int(_1, _2, 0x788, true, "QGT")`)),
    cat("int_cmp", mkfixedn(0xb7c3, 16, 8, "QNEQINT", seq1(int(8)), `(_1, _2) => exec_cmp_int(_1, _2, 0x787, true, "QNEQ")`)),
    cat("int_const", mkfixedn(0x84, 8, 8, "PUSHPOW2DEC", seq1(delta(1, uint(8))), `exec_push_pow2dec`)),
    cat("int_const", mkfixedn(0x85, 8, 8, "PUSHNEGPOW2", seq1(delta(1, uint(8))), `exec_push_negpow2`)),
    cat("shift_logic", mkfixedn(0xaa, 8, 8, "LSHIFT", seq1(delta(1, uint(8))), `(_1, _2) => exec_lshift_tinyint8(_1, _2, false)`)),
    cat("shift_logic", mkfixedn(0xab, 8, 8, "RSHIFT", seq1(delta(1, uint(8))), `(_1, _2) => exec_rshift_tinyint8(_1, _2, false)`)),
    cat("shift_logic", mkfixedn(0xb4, 8, 8, "FITS", seq1(delta(1, uint(8))), `(_1, _2) => exec_fits_tinyint8(_1, _2, false)`)),
    cat("shift_logic", mkfixedn(0xb5, 8, 8, "UFITS", seq1(delta(1, uint(8))), `(_1, _2) => exec_ufits_tinyint8(_1, _2, false)`)),
    cat("shift_logic", mkfixedn(0xb7aa, 16, 8, "QLSHIFT", seq1(delta(1, uint(8))), `(_1, _2) => exec_lshift_tinyint8(_1, _2, true)`)),
    cat("shift_logic", mkfixedn(0xb7ab, 16, 8, "QRSHIFT", seq1(delta(1, uint(8))), `(_1, _2) => exec_rshift_tinyint8(_1, _2, true)`)),
    cat("shift_logic", mkfixedn(0xb7b4, 16, 8, "QFITS", seq1(delta(1, uint(8))), `(_1, _2) => exec_fits_tinyint8(_1, _2, true)`)),
    cat("shift_logic", mkfixedn(0xb7b5, 16, 8, "QUFITS", seq1(delta(1, uint(8))), `(_1, _2) => exec_ufits_tinyint8(_1, _2, true)`)),
    cat("cell_serialize", mkfixedn(0xca, 8, 8, "STI", seq1(delta(1, uint(8))), `(_1, _2) => exec_store_int(_1, _2, true)`)),
    cat("cell_serialize", mkfixedn(0xcb, 8, 8, "STU", seq1(delta(1, uint(8))), `(_1, _2) => exec_store_int(_1, _2, false)`)),
    cat("cell_serialize", mkfixedn(0xcf38, 16, 8, "BCHKBITS", seq1(delta(1, uint(8))), `(_1, _2) => exec_builder_chk_bits(_1, _2, false)`)),
    cat("cell_serialize", mkfixedn(0xcf3c, 16, 8, "BCHKBITSQ", seq1(delta(1, uint(8))), `(_1, _2) => exec_builder_chk_bits(_1, _2, true)`)),
    cat("cell_deserialize", mkfixedn(0xd2, 8, 8, "LDI", seq1(delta(1, uint(8))), `(_1, _2) => exec_load_int_fixed(_1, _2, 0)`)),
    cat("cell_deserialize", mkfixedn(0xd3, 8, 8, "LDU", seq1(delta(1, uint(8))), `(_1, _2) => exec_load_int_fixed(_1, _2, 1)`)),
    cat("cell_deserialize", mkfixedn(0xd6, 8, 8, "LDSLICE", seq1(delta(1, uint(8))), `exec_load_slice_fixed`)),
    version(9, cat("continuation_change", mkfixedn(0xede3, 16, 8, "SETCONTCTRMANY", seq1(delta(1, uint(8))), `exec_setcont_ctr_many`))),
    cat("continuation_jump", mkfixedn(0xdb36, 16, 8, "CALLCCARGS", seq2(uint(4), uint(4)), `exec_callcc_args`)),
    cat("exception", mkfixedn(0xf3, 8, 8, "TRYARGS", seq2(uint(4), uint(4)), `exec_try`)),
    cat("cell_deserialize", mkfixedn(0xd74c >> 2, 14, 2, "PLDREFIDX", seq1(uint(2)), `exec_preload_ref_fixed`)),
    version(6, cat("cell_deserialize", mkfixedn(0xd768 >> 2, 14, 2, "CHASHI", seq1(uint(2)), `(_1, _2) => exec_cell_hash_i(_1, _2, false)`))),
    version(6, cat("cell_deserialize", mkfixedn(0xd76c >> 2, 14, 2, "CDEPTHI", seq1(uint(2)), `(_1, _2) => exec_cell_depth_i(_1, _2, false)`))),
    cat("continuation_dict_jump", mkfixedn(0xf0, 8, 8, "CALLDICT", seq1(uint(8)), `exec_calldict_short`)),
    cat("continuation_dict_jump", mkfixedn(0xf10 >> 2, 10, 14, "CALLDICT", seq1(uint(14)), `exec_calldict`)),
    cat("continuation_dict_jump", mkfixedn(0xf14 >> 2, 10, 14, "JMPDICT", seq1(uint(14)), `exec_jmpdict`)),
    cat("continuation_dict_jump", mkfixedn(0xf18 >> 2, 10, 14, "PREPAREDICT", seq1(uint(14)), `exec_preparedict`)),
    cat("exception", mkfixedn(0xf20 >> 2, 10, 6, "THROW", seq1(uint(6)), `(_1, _2) => exec_throw_fixed(_1, _2, 63, 0)`)),
    cat("exception", mkfixedn(0xf24 >> 2, 10, 6, "THROWIF", seq1(uint(6)), `(_1, _2) => exec_throw_fixed(_1, _2, 63, 3)`)),
    cat("exception", mkfixedn(0xf28 >> 2, 10, 6, "THROWIFNOT", seq1(uint(6)), `(_1, _2) => exec_throw_fixed(_1, _2, 63, 2)`)),
    cat("exception", mkfixedn(0xf2c0 >> 3, 13, 11, "THROW", seq1(uint(11)), `(_1, _2) => exec_throw_fixed(_1, _2, 0x7ff, 0)`)),
    cat("exception", mkfixedn(0xf2c8 >> 3, 13, 11, "THROWARG", seq1(uint(11)), `(_1, _2) => exec_throw_arg_fixed(_1, _2, 0x7ff, 0)`)),
    cat("exception", mkfixedn(0xf2d0 >> 3, 13, 11, "THROWIF", seq1(uint(11)), `(_1, _2) => exec_throw_fixed(_1, _2, 0x7ff, 3)`)),
    cat("exception", mkfixedn(0xf2d8 >> 3, 13, 11, "THROWARGIF", seq1(uint(11)), `(_1, _2) => exec_throw_arg_fixed(_1, _2, 0x7ff, 3)`)),
    cat("exception", mkfixedn(0xf2e0 >> 3, 13, 11, "THROWIFNOT", seq1(uint(11)), `(_1, _2) => exec_throw_fixed(_1, _2, 0x7ff, 2)`)),
    cat("exception", mkfixedn(0xf2e8 >> 3, 13, 11, "THROWARGIFNOT", seq1(uint(11)), `(_1, _2) => exec_throw_arg_fixed(_1, _2, 0x7ff, 2)`)),
    
    cat("continuation_jump", mkfixedn(0xdb1, 12, 4, "JMPXARGS", seq1(uint(4)), `exec_jmpx_args`)),
    cat("continuation_jump", mkfixedn(0xdb2, 12, 4, "RETARGS", seq1(uint(4)), `exec_ret_args`)),
    cat("continuation_change", mkfixedn(0xed0, 12, 4, "RETURNARGS", seq1(uint(4)), `exec_return_args`)),
    cat("stack", mkfixedn(0x5f0, 12, 4, "BLKDROP", seq1(uint(4)), `exec_blkdrop`)),
    cat("tuple", mkfixedn(0x6f0, 12, 4, "TUPLE", seq1(uint(4)), `exec_mktuple`)),
    cat("tuple", mkfixedn(0x6f1, 12, 4, "INDEX", seq1(uint(4)), `exec_tuple_index`)),
    cat("tuple", mkfixedn(0x6f2, 12, 4, "UNTUPLE", seq1(uint(4)), `exec_untuple`)),
    cat("tuple", mkfixedn(0x6f3, 12, 4, "UNPACKFIRST", seq1(uint(4)), `exec_untuple_first`)),
    cat("tuple", mkfixedn(0x6f4, 12, 4, "EXPLODE", seq1(uint(4)), `exec_explode_tuple`)),
    cat("tuple", mkfixedn(0x6f5, 12, 4, "SETINDEX", seq1(uint(4)), `exec_tuple_set_index`)),
    cat("tuple", mkfixedn(0x6f6, 12, 4, "INDEXQ", seq1(uint(4)), `exec_tuple_quiet_index`)),
    cat("tuple", mkfixedn(0x6f7, 12, 4, "SETINDEXQ", seq1(uint(4)), `exec_tuple_quiet_set_index`)),
    cat("stack", mkfixedn(0x4, 4, 12, "XCHG3", seq3(stack(4), stack(4), stack(4)), `exec_xchg3`)),
    cat("stack", mkfixedn(0x540, 12, 12, "XCHG3", seq3(stack(4), stack(4), stack(4)), `exec_xchg3`)),
    cat("stack", mkfixedn(0x541, 12, 12, "XC2PU", seq3(stack(4), stack(4), stack(4)), `exec_xc2pu`)),
    cat("stack", mkfixedn(0x543, 12, 12, "XCPU2", seq3(stack(4), stack(4), stack(4)), `exec_xcpu2`)),
    cat("stack", mkfixedn(0x547, 12, 12, "PUSH3", seq3(stack(4), stack(4), stack(4)), `exec_push3`)),
    cat("stack", mkfixedn(0x50, 8, 8, "XCHG2", seq2(stack(4), stack(4)), `exec_xchg2`)),
    cat("stack", mkfixedn(0x51, 8, 8, "XCPU", seq2(stack(4), stack(4)), `exec_xcpu`)),
    cat("stack", mkfixedn(0x53, 8, 8, "PUSH2", seq2(stack(4), stack(4)), `exec_push2`)),
    cat("stack", mkfixedn(0x52, 8, 8, "PUXC", seq2(stack(4), delta(-1, stack(4))), `exec_puxc`)),
    cat("stack", mkfixedn(0x542, 12, 12, "XCPUXC", seq3(stack(4), stack(4), delta(-1, stack(4))), `exec_xcpuxc`)),
    cat("stack", mkfixedn(0x544, 12, 12, "PUXC2", seq3(stack(4), delta(-1, stack(4)), delta(-1, stack(4))), `exec_puxc2`)),
    cat("stack", mkfixedn(0x545, 12, 12, "PUXCPU", seq3(stack(4), delta(-1, stack(4)), delta(-1, stack(4))), `exec_puxcpu`)),
    cat("stack", mkfixedn(0x546, 12, 12, "PU2XC", seq3(stack(4), delta(-1, stack(4)), delta(-2, stack(4))), `exec_pu2xc`)),
    cat("stack", mkfixedn(0x55, 8, 8, "BLKSWAP", seq2(delta(1, uint(4)), delta(1, uint(4))), `exec_blkswap`)),
    cat("stack", mkfixedn(0x5e, 8, 8, "REVERSE", seq2(delta(2, uint(4)), uint(4)), `exec_reverse`)),
    cat("continuation_change", mkfixedn(0xec, 8, 8, "SETCONTARGS", seq2(uint(4), delta(-1, uint(4))), `exec_setcontargs`)),
    cat("continuation_change", mkfixedn(0xee, 8, 8, "BLESSARGS", seq2(uint(4), delta(-1, uint(4))), `exec_bless_args`)),
    version(4, cat("div", mkfixedn(0xa930, 16, 8, "ADDRSHIFT#MOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_shrmod(_1, _2, 2)`))),
    version(4, cat("div", mkfixedn(0xa931, 16, 8, "ADDRSHIFTR#MOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_shrmod(_1, _2, 2)`))),
    version(4, cat("div", mkfixedn(0xa932, 16, 8, "ADDRSHIFTC#MOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_shrmod(_1, _2, 2)`))),
    cat("div", mkfixedn(0xa934, 16, 8, "RSHIFT#", seq1(delta(1, uint(8))), `(_1, _2) => exec_shrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa935, 16, 8, "RSHIFTR#", seq1(delta(1, uint(8))), `(_1, _2) => exec_shrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa936, 16, 8, "RSHIFTC#", seq1(delta(1, uint(8))), `(_1, _2) => exec_shrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa938, 16, 8, "MODPOW2#", seq1(delta(1, uint(8))), `(_1, _2) => exec_shrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa939, 16, 8, "MODPOW2R#", seq1(delta(1, uint(8))), `(_1, _2) => exec_shrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa93a, 16, 8, "MODPOW2C#", seq1(delta(1, uint(8))), `(_1, _2) => exec_shrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa93c, 16, 8, "RSHIFT#MOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_shrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa93d, 16, 8, "RSHIFTR#MOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_shrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa93e, 16, 8, "RSHIFTC#MOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_shrmod(_1, _2, 2)`)),
    version(4, cat("div", mkfixedn(0xa9b0, 16, 8, "MULADDRSHIFT#MOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_mulshrmod(_1, _2, 2)`))),
    version(4, cat("div", mkfixedn(0xa9b1, 16, 8, "MULADDRSHIFTR#MOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_mulshrmod(_1, _2, 2)`))),
    version(4, cat("div", mkfixedn(0xa9b2, 16, 8, "MULADDRSHIFTC#MOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_mulshrmod(_1, _2, 2)`))),
    cat("div", mkfixedn(0xa9b4, 16, 8, "MULRSHIFT#", seq1(delta(1, uint(8))), `(_1, _2) => exec_mulshrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9b5, 16, 8, "MULRSHIFTR#", seq1(delta(1, uint(8))), `(_1, _2) => exec_mulshrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9b6, 16, 8, "MULRSHIFTC#", seq1(delta(1, uint(8))), `(_1, _2) => exec_mulshrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9b8, 16, 8, "MULMODPOW2#", seq1(delta(1, uint(8))), `(_1, _2) => exec_mulshrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9b9, 16, 8, "MULMODPOW2R#", seq1(delta(1, uint(8))), `(_1, _2) => exec_mulshrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9ba, 16, 8, "MULMODPOW2C#", seq1(delta(1, uint(8))), `(_1, _2) => exec_mulshrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9bc, 16, 8, "MULRSHIFT#MOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_mulshrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9bd, 16, 8, "MULRSHIFTR#MOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_mulshrmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9be, 16, 8, "MULRSHIFTC#MOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_mulshrmod(_1, _2, 2)`)),
    version(4, cat("div", mkfixedn(0xa9d0, 16, 8, "LSHIFT#ADDDIVMOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_shldivmod(_1, _2, 2)`))),
    version(4, cat("div", mkfixedn(0xa9d1, 16, 8, "LSHIFT#ADDDIVMODR", seq1(delta(1, uint(8))), `(_1, _2) => exec_shldivmod(_1, _2, 2)`))),
    version(4, cat("div", mkfixedn(0xa9d2, 16, 8, "LSHIFT#ADDDIVMODC", seq1(delta(1, uint(8))), `(_1, _2) => exec_shldivmod(_1, _2, 2)`))),
    cat("div", mkfixedn(0xa9d4, 16, 8, "LSHIFT#DIV", seq1(delta(1, uint(8))), `(_1, _2) => exec_shldivmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9d5, 16, 8, "LSHIFT#DIVR", seq1(delta(1, uint(8))), `(_1, _2) => exec_shldivmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9d6, 16, 8, "LSHIFT#DIVC", seq1(delta(1, uint(8))), `(_1, _2) => exec_shldivmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9d8, 16, 8, "LSHIFT#MOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_shldivmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9d9, 16, 8, "LSHIFT#MODR", seq1(delta(1, uint(8))), `(_1, _2) => exec_shldivmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9da, 16, 8, "LSHIFT#MODC", seq1(delta(1, uint(8))), `(_1, _2) => exec_shldivmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9dc, 16, 8, "LSHIFT#DIVMOD", seq1(delta(1, uint(8))), `(_1, _2) => exec_shldivmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9dd, 16, 8, "LSHIFT#DIVMODR", seq1(delta(1, uint(8))), `(_1, _2) => exec_shldivmod(_1, _2, 2)`)),
    cat("div", mkfixedn(0xa9de, 16, 8, "LSHIFT#DIVMODC", seq1(delta(1, uint(8))), `(_1, _2) => exec_shldivmod(_1, _2, 2)`)),
    cat("cell_serialize", mkfixedn(0xcf08, 16, 8, "STI", seq1(delta(1, uint(8))), `exec_store_int_fixed`)),
    cat("cell_serialize", mkfixedn(0xcf09, 16, 8, "STU", seq1(delta(1, uint(8))), `exec_store_int_fixed`)),
    cat("cell_serialize", mkfixedn(0xcf0a, 16, 8, "STIR", seq1(delta(1, uint(8))), `exec_store_int_fixed`)),
    cat("cell_serialize", mkfixedn(0xcf0b, 16, 8, "STUR", seq1(delta(1, uint(8))), `exec_store_int_fixed`)),
    cat("cell_serialize", mkfixedn(0xcf0c, 16, 8, "STIQ", seq1(delta(1, uint(8))), `exec_store_int_fixed`)),
    cat("cell_serialize", mkfixedn(0xcf0d, 16, 8, "STUQ", seq1(delta(1, uint(8))), `exec_store_int_fixed`)),
    cat("cell_serialize", mkfixedn(0xcf0e, 16, 8, "STIRQ", seq1(delta(1, uint(8))), `exec_store_int_fixed`)),
    cat("cell_serialize", mkfixedn(0xcf0f, 16, 8, "STURQ", seq1(delta(1, uint(8))), `exec_store_int_fixed`)),
    cat("cell_deserialize", mkfixedn(0xd708, 16, 8, "LDI", seq1(delta(1, uint(8))), `exec_load_int_fixed2`)),
    cat("cell_deserialize", mkfixedn(0xd709, 16, 8, "LDU", seq1(delta(1, uint(8))), `exec_load_int_fixed2`)),
    cat("cell_deserialize", mkfixedn(0xd70a, 16, 8, "PLDI", seq1(delta(1, uint(8))), `exec_load_int_fixed2`)),
    cat("cell_deserialize", mkfixedn(0xd70b, 16, 8, "PLDU", seq1(delta(1, uint(8))), `exec_load_int_fixed2`)),
    cat("cell_deserialize", mkfixedn(0xd70c, 16, 8, "LDIQ", seq1(delta(1, uint(8))), `exec_load_int_fixed2`)),
    cat("cell_deserialize", mkfixedn(0xd70d, 16, 8, "LDUQ", seq1(delta(1, uint(8))), `exec_load_int_fixed2`)),
    cat("cell_deserialize", mkfixedn(0xd70e, 16, 8, "PLDIQ", seq1(delta(1, uint(8))), `exec_load_int_fixed2`)),
    cat("cell_deserialize", mkfixedn(0xd70f, 16, 8, "PLDUQ", seq1(delta(1, uint(8))), `exec_load_int_fixed2`)),
    cat("cell_deserialize", mkfixedn(0xd710 >> 3, 13, 3, "PLDUZ", seq1(plduzArg), `exec_preload_uint_fixed_0e`)),
    cat("cell_deserialize", mkfixedn(0xd71c, 16, 8, "LDSLICE", seq1(delta(1, uint(8))), `exec_load_slice_fixed2`)),
    cat("cell_deserialize", mkfixedn(0xd71d, 16, 8, "PLDSLICE", seq1(delta(1, uint(8))), `exec_load_slice_fixed2`)),
    cat("cell_deserialize", mkfixedn(0xd71e, 16, 8, "LDSLICEQ", seq1(delta(1, uint(8))), `exec_load_slice_fixed2`)),
    cat("cell_deserialize", mkfixedn(0xd71f, 16, 8, "PLDSLICEQ", seq1(delta(1, uint(8))), `exec_load_slice_fixed2`)),
    cat("continuation_cond_loop", mkfixedn(0xe380 >> 5, 10, 5, "IFBITJMP", seq1(uint(5)), `exec_if_bit_jmp`)),
    cat("continuation_cond_loop", mkfixedn(0xe3a0 >> 5, 10, 5, "IFNBITJMP", seq1(uint(5)), `exec_if_bit_jmp`)),
    cat("tuple", mkfixedn(0x6fb, 12, 4, "INDEX2", seq2(uint(2), uint(2)), `exec_tuple_index2`)),
    cat("tuple", mkfixedn(0x6fc >> 2, 10, 6, "INDEX3", seq3(uint(2), uint(2), uint(2)), `exec_tuple_index3`)),
    cat("debug_enabled", mkfixedn(0xfe2, 12, 4, "DUMP", seq1(stack(4)), `exec_dump_value`)),

    cat("int_const", mkfixedrangen(0x8300, 0x83ff, 16, 8, "PUSHPOW2", seq1(delta(1, uint(8))), `exec_push_pow2`)),
    cat("stack", mkfixedrangen(0x5f10, 0x6000, 16, 8, "BLKPUSH", seq2(uint(4), uint(4)), `exec_blkpush`)),
    cat("stack", mkfixedrangen(0x6c10, 0x6d00, 16, 8, "BLKDROP2", seq2(uint(4), uint(4)), `exec_blkdrop2`)),
    cat("debug_disabled", mkfixedrangen(0xfe00, 0xfef0, 16, 8, "DEBUG", seq1(uint(8)), `exec_dummy_debug`)),
    cat("debug_enabled", mkfixedrangen(0xfe01, 0xfe14, 16, 8, "DEBUG", seq1(uint(8)), `exec_dummy_debug`)),
    cat("debug_enabled", mkfixedrangen(0xfe15, 0xfe20, 16, 8, "DEBUG", seq1(uint(8)), `exec_dummy_debug`)),
    cat("debug_enabled", mkfixedrangen(0xfe30, 0xfef0, 16, 8, "DEBUG", seq1(uint(8)), `exec_dummy_debug`)),
    cat("config", mkfixedrangen(0xf841, 0xf860, 16, 5, "GETGLOB", seq1(uint(5)), `exec_get_global`)),
    cat("config", mkfixedrangen(0xf861, 0xf880, 16, 5, "SETGLOB", seq1(uint(5)), `exec_set_global`)),
    cat("continuation_change", mkfixedrangen(0xed40, 0xed44, 16, 4, "PUSH", seq1(control), `exec_push_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed44, 0xed46, 16, 4, "PUSH", seq1(control), `exec_push_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed47, 0xed48, 16, 4, "PUSH", seq1(control), `exec_push_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed50, 0xed54, 16, 4, "POP", seq1(control), `exec_pop_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed54, 0xed56, 16, 4, "POP", seq1(control), `exec_pop_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed57, 0xed58, 16, 4, "POP", seq1(control), `exec_pop_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed60, 0xed64, 16, 4, "SETCONTCTR", seq1(control), `exec_setcont_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed64, 0xed66, 16, 4, "SETCONTCTR", seq1(control), `exec_setcont_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed67, 0xed68, 16, 4, "SETCONTCTR", seq1(control), `exec_setcont_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed70, 0xed74, 16, 4, "SETRETCTR", seq1(control), `exec_setret_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed74, 0xed76, 16, 4, "SETRETCTR", seq1(control), `exec_setret_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed77, 0xed78, 16, 4, "SETRETCTR", seq1(control), `exec_setret_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed80, 0xed84, 16, 4, "SETALTCTR", seq1(control), `exec_setalt_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed84, 0xed86, 16, 4, "SETALTCTR", seq1(control), `exec_setalt_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed87, 0xed88, 16, 4, "SETALTCTR", seq1(control), `exec_setalt_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed90, 0xed94, 16, 4, "POPSAVE", seq1(control), `exec_popsave_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed94, 0xed96, 16, 4, "POPSAVE", seq1(control), `exec_popsave_ctr`)),
    cat("continuation_change", mkfixedrangen(0xed97, 0xed98, 16, 4, "POPSAVE", seq1(control), `exec_popsave_ctr`)),
    cat("continuation_change", mkfixedrangen(0xeda0, 0xeda4, 16, 4, "SAVECTR", seq1(control), `exec_save_ctr`)),
    cat("continuation_change", mkfixedrangen(0xeda4, 0xeda6, 16, 4, "SAVECTR", seq1(control), `exec_save_ctr`)),
    cat("continuation_change", mkfixedrangen(0xeda7, 0xeda8, 16, 4, "SAVECTR", seq1(control), `exec_save_ctr`)),
    cat("continuation_change", mkfixedrangen(0xedb0, 0xedb4, 16, 4, "SAVEALTCTR", seq1(control), `exec_savealt_ctr`)),
    cat("continuation_change", mkfixedrangen(0xedb4, 0xedb6, 16, 4, "SAVEALTCTR", seq1(control), `exec_savealt_ctr`)),
    cat("continuation_change", mkfixedrangen(0xedb7, 0xedb8, 16, 4, "SAVEALTCTR", seq1(control), `exec_savealt_ctr`)),
    cat("continuation_change", mkfixedrangen(0xedc0, 0xedc4, 16, 4, "SAVEBOTHCTR", seq1(control), `exec_saveboth_ctr`)),
    cat("continuation_change", mkfixedrangen(0xedc4, 0xedc6, 16, 4, "SAVEBOTHCTR", seq1(control), `exec_saveboth_ctr`)),
    cat("continuation_change", mkfixedrangen(0xedc7, 0xedc8, 16, 4, "SAVEBOTHCTR", seq1(control), `exec_saveboth_ctr`)),
    cat("config", mkfixedrangen(0xf820, 0xf823, 16, 4, "GETPARAM", seq1(uint(4)), `exec_get_var_param`)),

    cat("cell_const", mkext(1, 0x88, 8, 0, "PUSHREF", noArgs, `(_1, _2, _3, _4) => exec_push_ref(_1, _2, 0, _4)`)),
    cat("cell_const", mkext(1, 0x89, 8, 0, "PUSHREFSLICE", noArgs, `(_1, _2, _3, _4) => exec_push_ref(_1, _2, 1, _4)`)),
    cat("cell_const", mkext(1, 0x8a, 8, 0, "PUSHREFCONT", noArgs, `(_1, _2, _3, _4) => exec_push_ref(_1, _2, 2, _4)`)),
    cat("continuation_jump", mkext(1, 0xdb3c, 16, 0, "CALLREF", noArgs, `(_1, _2, _3, _4) => exec_do_with_ref(_1, _2, _4, (st, cont) => st.call((cont)), "CALLREF")`)),
    cat("continuation_jump", mkext(1, 0xdb3d, 16, 0, "JMPREF", noArgs, `(_1, _2, _3, _4) => exec_do_with_ref(_1, _2, _4, (st, cont) => st.jump((cont)), "JMPREF")`)),
    cat("continuation_jump", mkext(1, 0xdb3e, 16, 0, "JMPREFDATA", noArgs, `(_1, _2, _3, _4) => exec_do_with_ref(_1, _2, _4, (st, cont) => { st.push_code(); return st.jump((cont)) }, "JMPREFDATA")`)),
    cat("continuation_cond_loop", mkext(1, 0xe300, 16, 0, "IFREF", noArgs, `(_1, _2, _3, _4) => exec_do_with_cell(1, _2, _4, (st, cell) => st.get_stack().pop_bool() ? st.call(st.ref_to_cont((cell))) : 0, "IFREF")`)),
    cat("continuation_cond_loop", mkext(1, 0xe301, 16, 0, "IFNOTREF", noArgs, `(_1, _2, _3, _4) => exec_do_with_cell(1, _2, _4, (st, cell) => st.get_stack().pop_bool() ? 0 : st.call(st.ref_to_cont((cell))), "IFNOTREF")`)),
    cat("continuation_cond_loop", mkext(1, 0xe302, 16, 0, "IFJMPREF", noArgs, `(_1, _2, _3, _4) => exec_do_with_cell(1, _2, _4, (st, cell) => st.get_stack().pop_bool() ? st.jump(st.ref_to_cont((cell))) : 0, "IFJMPREF")`)),
    cat("continuation_cond_loop", mkext(1, 0xe303, 16, 0, "IFNOTJMPREF", noArgs, `(_1, _2, _3, _4) => exec_do_with_cell(1, _2, _4, (st, cell) => st.get_stack().pop_bool() ? 0 : st.jump(st.ref_to_cont((cell))), "IFNOTJMPREF")`)),
    cat("continuation_cond_loop", mkext(1, 0xe30d, 16, 0, "IFREFELSE", noArgs, `(_1, _2, _3, _4) => exec_ifelse_ref(_1, _2, _4, true)`)),
    cat("continuation_cond_loop", mkext(1, 0xe30e, 16, 0, "IFELSEREF", noArgs, `(_1, _2, _3, _4) => exec_ifelse_ref(_1, _2, _4, false)`)),
    cat("continuation_cond_loop", mkext(2, 0xe30f, 16, 0, "IFREFELSEREF", noArgs, `exec_ifref_elseref`)),

    cat("dictionary", mkextrange(1, 0xf4a400, 0xf4a800, 24, 11, "DICTPUSHCONST", seq2(uint(1), uint(10)), `exec_push_const_dict`)),
    cat("dictionary", mkextrange(1, 0xf4ac00, 0xf4b000, 24, 11, "PFXDICTSWITCH", seq2(uint(1), uint(10)), `exec_const_pfx_dict_switch`)),

    cat("continuation_jump", mkfixedn(0xdb0, 12, 4, "CALLXARGS", seq2(uint(4), minusOne), `exec_callx_args_p`)),
    cat("continuation_jump", mkfixedn(0xda, 8, 8, "CALLXARGS", seq2(uint(4), uint(4)), `exec_callx_args`)),

    cat("cell_const", mkext(0, 0x8b, 8, 4, "PUSHSLICE", slice(uint(4), 4), `exec_push_slice`)),
    cat("cell_const", mkext(1, 0x8c0 >> 2, 10, 5, "PUSHSLICE", slice(uint(5), 1), `exec_push_slice_r`)),
    cat("cell_const", mkext(2, 0x8c4 >> 2, 10, 5, "PUSHSLICE", slice(uint(5), 1), `exec_push_slice_r`)),
    cat("cell_const", mkext(3, 0x8c8 >> 2, 10, 5, "PUSHSLICE", slice(uint(5), 1), `exec_push_slice_r`)),
    cat("cell_const", mkext(4, 0x8cc >> 2, 10, 5, "PUSHSLICE", slice(uint(5), 1), `exec_push_slice_r`)),
    cat("cell_const", mkext(0, 0x8d0 >> 1, 11, 7, "PUSHSLICE", slice(uint(7), 6), `exec_push_slice_r2`)),
    cat("cell_const", mkext(1, 0x8d2 >> 1, 11, 7, "PUSHSLICE", slice(uint(7), 6), `exec_push_slice_r2`)),
    cat("cell_const", mkext(2, 0x8d4 >> 1, 11, 7, "PUSHSLICE", slice(uint(7), 6), `exec_push_slice_r2`)),
    cat("cell_const", mkext(3, 0x8d6 >> 1, 11, 7, "PUSHSLICE", slice(uint(7), 6), `exec_push_slice_r2`)),
    cat("cell_const", mkext(4, 0x8d8 >> 1, 11, 7, "PUSHSLICE", slice(uint(7), 6), `exec_push_slice_r2`)),

    cat("cell_const", mkext(0, 0x8e0 >> 3, 9, 7, "PUSHCONT", slice(uint(7), 0), `exec_push_cont`)),
    cat("cell_const", mkext(1, 0x8e8 >> 3, 9, 7, "PUSHCONT", slice(uint(7), 0), `exec_push_cont`)),
    cat("cell_const", mkext(2, 0x8f0 >> 3, 9, 7, "PUSHCONT", slice(uint(7), 0), `exec_push_cont`)),
    cat("cell_const", mkext(3, 0x8f8 >> 3, 9, 7, "PUSHCONT", slice(uint(7), 0), `exec_push_cont`)),
    cat("cell_const", mkext(0, 0x9, 4, 4, "PUSHCONT", slice(uint(4), 0), `exec_push_cont_simple`)),

    cat("cell_serialize", mkext(0, 0xcf8 >> 1, 11, 3, "STSLICECONST", slice(uint(3), 2), `exec_store_const_slice`)),
    cat("cell_serialize", mkext(1, 0xcfa >> 1, 11, 3, "STSLICECONST", slice(uint(3), 2), `exec_store_const_slice`)),
    cat("cell_serialize", mkext(2, 0xcfc >> 1, 11, 3, "STSLICECONST", slice(uint(3), 2), `exec_store_const_slice`)),
    cat("cell_serialize", mkext(3, 0xcfe >> 1, 11, 3, "STSLICECONST", slice(uint(3), 2), `exec_store_const_slice`)),

    cat("cell_deserialize", mkext(0, 0xd728 >> 2, 14, 7, "SDBEGINS", slice(uint(7), 3), `exec_slice_begins_with_const`)),
    cat("cell_deserialize", mkext(0, 0xd72c >> 2, 14, 7, "SDBEGINSQ", slice(uint(7), 3), `exec_slice_begins_with_const`)),

    cat("continuation_cond_loop", mkext(1, 0xe3c >> 1, 11, 5, "IFBITJMPREF", seq1(uint(5)), `exec_if_bit_jmpref`)),
    cat("continuation_cond_loop", mkext(1, 0xe3c >> 1, 11, 5, "IFNBITJMPREF", seq1(uint(5)), `exec_if_bit_jmpref`)),

    cat("debug_disabled", mkext(0, 0xfef, 12, 4, "DEBUGSTR", slice(delta(1, uint(4)), 0), `exec_dummy_debug_str`)),
    cat("debug_enabled", mkext(0, 0xfef, 12, 4, "DEBUGSTR", slice(delta(1, uint(4)), 0), `exec_dummy_debug_str`)),

    cat("cell_serialize", mkext(0, 0xcf20, 16, 0, "STREFCONST", noArgs, `exec_store_const_ref`)),
    cat("cell_serialize", mkext(1, 0xcf21, 16, 0, "STREF2CONST", noArgs, `exec_store_const_ref`)),

    cat("int_const", mkfixedn(0x7, 4, 4, "PUSHINT", seq1(tinyInt), `exec_push_tinyint4`)),
    cat("int_const", mkfixedn(0x81, 8, 16, "PUSHINT", seq1(int(16)), `exec_push_smallint`)),
    cat("int_const", mkfixedn(0x80, 8, 8, "PUSHINT", seq1(int(8)), `exec_push_tinyint8`)),
    cat("int_const", mkextrange(0, 0x820 << 1, (0x820 << 1) + 31, 13, 5, "PUSHINT", largeInt, `exec_push_int`)),

    version(4, cat("continuation_jump", mkfixedn(0xdb4, 12, 12, "RUNVM", seq1(runvmArg), `exec_runvm`))),

    
    version(4, cat("crypto", mkfixedn(0xf904, 16, 8, "HASHEXT", seq1(hash), `exec_hash_ext`))),
    version(4, cat("crypto", mkfixedn(0xf905, 16, 8, "HASHEXTR", seq1(hash), `exec_hash_ext`))),
    version(4, cat("crypto", mkfixedn(0xf906, 16, 8, "HASHEXTA", seq1(hash), `exec_hash_ext`))),
    version(4, cat("crypto", mkfixedn(0xf907, 16, 8, "HASHEXTAR", seq1(hash), `exec_hash_ext`))),

    cat("stack", mkfixedn(0x11, 8, 8, "XCHG", stack(8), `exec_xchg0_l`)),
    cat("stack", mkfixedn(0x10, 8, 8, "XCHG", xchgArgs, `exec_xchg`)),
    cat("stack", mkfixedrangen(0x02, 0x10, 8, 4, "XCHG", seq1(stack(4)), `exec_xchg0`)),
    cat("stack", mkfixedrangen(0x12, 0x20, 8, 4, "XCHG", seq2(s1, stack(4)), `exec_xchg1`)),

    cat("stack", mkfixedn(0x56, 8, 8, "PUSH", stack(8), `exec_push_l`)),
    cat("stack", mkfixedrangen(0x22, 0x30, 8, 4, "PUSH", seq1(stack(4)), `exec_push`)),

    cat("stack", mkfixedn(0x57, 8, 8, "POP", stack(8), `exec_pop_l`)),
    cat("stack", mkfixedrangen(0x32, 0x40, 8, 4, "POP", seq1(stack(4)), `exec_pop`)),

    cat("codepage", mkfixedrangen(0xff00, 0xfff0, 16, 8, "SETCP", seq1(uint(8)), `exec_set_cp`)),
    cat("codepage", mkfixedrangen(0xfff1, 0x10000, 16, 8, "SETCP", seq1(delta(-256, uint(8))), `exec_set_cp`)),
];

const sorted = instructions.sort((a, b) => a.min - b.min);

type InstructionOrDummy = Opcode<[], typeof dummyName> | (typeof instructions)[number]

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const instruction_list: InstructionOrDummy[] = [];
let upto = 0;
for (const instruction of sorted) {
    const { min, max } = instruction;
    assert(min < max);
    assert(min >= upto);
    assert(max <= top_opcode);
    if (upto < min) {
        instruction_list.push(dummy(upto, min));
    }
    instruction_list.push(instruction);
    upto = max;
}
if (upto < top_opcode) {
    instruction_list.push(dummy(upto, top_opcode));
}

export const dump_instr = (cs: Slice, vmVersion: number, isDebug: boolean) => {
    const bits = Math.min(cs.remainingBits, max_opcode_bits);
    const opcode = cs.preloadUint(bits) << (max_opcode_bits - bits);

    let i = 0;
    let j = instruction_list.length;
    while (j - i > 1) {
        const k = ((j + i) >> 1);
        const instr = instruction_list[k];
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (instr === undefined) {
            throw new Error();
        }
        if (instr.min <= opcode) {
            i = k;
        } else {
            j = k;
        }
    }

    const instr = instruction_list[i];
    // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
    if (instr === undefined) {
        throw new Error();
    }
    if (instr.name === dummyName) {
        return undefined;
    }
    if (bits < instr.checkLen) {
        return undefined;
    }
    cs.skip(instr.skipLen);
    // TODO: check version against vmVersion
    // TODO: check cat against isDebug
    const { args, refs, version: _version, cat: _cat } = instr;

    const result = args.load(cs);
    
    return dump(instr, cs, opcode, bits);
}