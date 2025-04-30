import { Cell, Slice } from "@ton/core";
import { Instr } from "@/asm/runtime/instr-gen";
import * as c from "@/asm/runtime/constructors";
import { codeType, compileCellWithMapping } from "@/asm/runtime/instr";
import { CodeBuilder, InstructionWithOffset, Mapping } from "@/asm/runtime/builder";
import { Dictionary, DictionaryValue } from "@/asm/dict/Dictionary";
import { JMPREF } from "@/asm/runtime/constructors";

// TODO: split:
// 1. like `constructors.ts`
// 2. like `types.ts`
//
// TODO: add more range checks in load and store of every type

export enum Hash {
    SHA256 = 0,
    SHA512 = 1,
    BLAKE2B = 2,
    KECCAK256 = 3,
    KECCAK512 = 4,
}

export type Loc = {
    readonly file: string;
    readonly line: number;
};

export const Loc = (file: string, line: number) => ({ file, line });

export type Store<T> = (b: CodeBuilder, t: T) => void;
export type Load<T> = (s: Slice) => T;

export type Type<T> = {
    readonly store: Store<T>;
    readonly load: Load<T>;
};

export function uint(bits: number): Type<number> {
    return {
        store: (b, t) => b.storeUint(t, bits),
        load: (s) => s.loadUint(bits),
    };
}

export const int = (bits: number): Type<number> => ({
    store: (b, t) => b.storeInt(t, bits),
    load: (s) => s.loadInt(bits),
});

export type Code = Raw | Instructions;

export type Raw = {
    readonly $: "Raw";
    readonly slice: Slice;
};

export type Instructions = {
    readonly $: "Instructions";
    readonly instructions: Instr[];
};

export const rawCode = (slice: Slice): Raw => ({
    $: "Raw",
    slice,
});

export const code = (instructions: Instr[]): Instructions => ({
    $: "Instructions",
    instructions,
});

export const decompiledCode = (instructions: Instr[]): Instructions => ({
    $: "Instructions",
    instructions,
});

const processMappingInstructions = (mapping: Mapping, b: CodeBuilder) =>
    mapping.instructions.map(
        ({ instr, offset, debugSection }): InstructionWithOffset => ({
            instr,
            offset: offset + b.bits,
            debugSection,
        }),
    );

export const codeSlice = (
    refs: Type<number>,
    bits: Type<number>,
): Type<Code> => {
    return {
        store: (b, code) => {
            // TODO: extract logic of serialization to codeType

            if (code.$ === "Instructions") {
                const [cell, mapping] = compileCellWithMapping(
                    code.instructions,
                );

                const slice = cell.asSlice();
                refs.store(b, slice.remainingRefs);

                const length = slice.remainingBits;
                const y = Math.ceil(length / 8);
                bits.store(b, y);

                const instructions = processMappingInstructions(mapping, b);
                b.pushInstructions(...instructions);
                b.pushMappings(...mapping.subMappings);
                b.pushDictionaryInfo(...mapping.dictionaryInfo);

                b.storeSlice(slice);
                return;
            }

            const slice = code.slice;

            refs.store(b, slice.remainingRefs);

            const length = slice.remainingBits;
            const y = Math.ceil(length / 8);
            bits.store(b, y);
            b.storeSlice(slice);
        },
        load: (s) => {
            const countRefs = refs.load(s);
            const y = bits.load(s);

            const realLength = y * 8;
            const r = s.loadBits(realLength);
            const b = new CodeBuilder();
            b.storeBits(r);
            for (let i = 0; i < countRefs; i++) {
                b.storeRef(s.loadRef());
            }
            const slice = b.asSlice();

            // TODO: move to codeType and rename to code
            try {
                return decompiledCode(codeType().load(slice));
            } catch {
                // continue with fallback
            }

            return rawCode(slice);
        },
    };
};

// TODO: ref(code) === ^code
export const refCodeSlice: Type<Code> = {
    store: (b, code) => {
        if (code.$ === "Instructions") {
            const [cell, mapping] = compileCellWithMapping(code.instructions);
            b.storeRef(cell);

            b.pushMappings(mapping);
            return;
        }

        b.storeRef(code.slice.asCell());
    },
    load: (s) => {
        const cell = s.loadRef();
        try {
            return decompiledCode(processCell(cell));
        } catch {
            // continue with fallback
        }

        return rawCode(cell.beginParse(true));
    },
};

const processCell = (cell: Cell): Instr[] => {
    if (cell.isExotic) {
        return [c.PSEUDO_EXOTIC(exotic.load(cell.beginParse(true)))];
    }

    return codeType().load(cell.asSlice());
};

export const inlineCodeSlice = (bits: Type<number>): Type<Code> => {
    return {
        store: (b, code) => {
            if (code.$ === "Raw") {
                const slice = code.slice;
                const length = slice.remainingBits;
                const y = Math.ceil(length / 8);
                bits.store(b, y);
                b.storeSlice(slice);
            } else {
                const [cell, mapping] = compileCellWithMapping(
                    code.instructions,
                );
                const slice = cell.asSlice();

                const length = slice.remainingBits;
                const y = Math.ceil(length / 8);
                bits.store(b, y);

                const instructions = processMappingInstructions(mapping, b);
                b.pushInstructions(...instructions);
                b.pushMappings(...mapping.subMappings);
                b.pushDictionaryInfo(...mapping.dictionaryInfo);

                b.storeSlice(slice);
            }
        },
        load: (s) => {
            const y = bits.load(s);

            const realLength = y * 8;
            const r = s.loadBits(realLength);
            const b = new CodeBuilder();
            b.storeBits(r);
            const slice = b.asSlice();
            try {
                return decompiledCode(codeType().load(slice));
            } catch {
                // continue with fallback
            }

            return rawCode(slice);
        },
    };
};

export const slice = (
    refs: Type<number> | number, // TODO: remove union
    bits: Type<number>,
    pad: number,
): Type<Slice> => {
    return {
        store: (b, slice) => {
            if (typeof refs !== "number") {
                refs.store(b, slice.remainingRefs);
            }
            const length = slice.remainingBits + 1;
            const y = Math.ceil((length - pad) / 8);
            bits.store(b, y);
            b.storeSlice(slice);
            b.storeUint(0x1, 1);
            const realLength = y * 8 + pad;
            b.storeUint(0x0, realLength - length);
        },
        load: (s) => {
            const countRefs = typeof refs === "number" ? refs : refs.load(s);
            const y = bits.load(s);
            const realLength = y * 8 + pad;
            const r = s.loadBits(realLength);

            let length = 0;
            for (let i = realLength - 1; i >= 0; i--) {
                if (!r.at(i)) {
                    // skip zeroes
                    continue;
                }

                // found first 1, trim all after, exclusive
                length = i;
                break;
            }

            const realData = r.substring(0, length);
            const b = new CodeBuilder();
            b.storeBits(realData);
            for (let i = 0; i < countRefs; i++) {
                b.storeRef(s.loadRef());
            }
            return b.asSlice();
        },
    };
};

export type DecompiledMethod = {
    readonly $: "DecompiledMethod";
    readonly id: number;
    readonly instructions: Instr[];
};
export const decompiledMethod = (
    id: number,
    instructions: Instr[],
): DecompiledMethod => ({
    $: "DecompiledMethod",
    id,
    instructions,
});

export type Dict = RawDict | DecompiledDict;

export type RawDict = {
    readonly $: "RawDict";
    readonly slice: Slice;
};

export type DecompiledDict = {
    readonly $: "DecompiledDict";
    readonly methods: DecompiledMethod[];
};

export const rawDict = (slice: Slice): RawDict => ({
    $: "RawDict",
    slice,
});

export const decompiledDict = (
    methods: DecompiledMethod[],
): DecompiledDict => ({
    $: "DecompiledDict",
    methods,
});

export const dictMap = (mapping: Map<number, Instr[]>): DecompiledDict => {
    return decompiledDict(
        [...mapping].map(([id, instructions]) => ({
            $: "DecompiledMethod",
            id,
            instructions,
        })),
    );
};

const codeDictValue: DictionaryValue<Cell> = {
    serialize: (src, builder) => {
        builder.pushDictionaryInfo({
            builder,
            childCell: src,
            offset: builder.bits,
        });

        builder.storeBits(src.bits);
        for (const ref of src.refs) {
            builder.storeRef(ref);
        }
    },
    parse: (src): Cell => {
        return src.clone(false).asCell();
    },
};

export const dictionary = (keyLength: number): Type<Dict> => {
    return {
        load: (slice) => {
            const dictCell = slice.asCell();

            const dict = Dictionary.loadDirect<number, Cell>(
                Dictionary.Keys.Int(keyLength),
                codeDictValue,
                dictCell,
            );

            const methods = [...dict].map(([key, cell]) => {
                return decompiledMethod(key, codeType().load(cell.asSlice()));
            });

            // const b = new CodeBuilder()
            // dictpush.store(b, [keyLength, decompiledDict(methods)])
            // const sliceAfter = b.asSlice()
            // const cellAfter = sliceAfter.loadRef()
            //
            // if (dictCell.toString() !== cellAfter.toString()) {
            //     // We cannot compile back to equal cell
            //     console.log(" (cannot decompile and compile back dict, fallback)")
            //     return rawDict(slice)
            // }

            return decompiledDict(methods);
        },
        store: (b, dict) => {
            if (dict.$ === "RawDict") {
                b.storeRef(dict.slice.asCell());
            }

            if (dict.$ === "DecompiledDict") {
                const dictMappings: Mapping[] = [];
                const dictionary = Dictionary.empty<number, Cell>(
                    Dictionary.Keys.Int(keyLength),
                    codeDictValue,
                );
                for (const method of dict.methods) {
                    const { id, instructions } = method;
                    const [cell, mapping] =
                        compileCellWithMapping(instructions);
                    dictMappings.push(mapping);
                    dictionary.set(id, cell);
                }

                b.pushMappings(...dictMappings);
                const codeBuilder = new CodeBuilder();
                b.storeRef(codeBuilder.storeDictDirect(dictionary).endCell());
                b.pushDictionaryInfo(...codeBuilder.getDictionaryInfo());
            }
        },
    };
};

export const dictpush: Type<[number, Dict]> = {
    load(s) {
        const keyLength = s.loadUint(10);
        const dictCell = s.loadRef();

        if (dictCell.bits.length === 0) {
            throw new Error("unexpected empty dictionary");
        }

        try {
            const dict = dictionary(keyLength).load(dictCell.asSlice());
            return [keyLength, dict];
        } catch {
            // fallback
        }

        return [keyLength, rawDict(dictCell.beginParse(true))];
    },
    store(b, [keyLength, dict]) {
        b.storeUint(keyLength, 10);
        dictionary(keyLength).store(b, dict);
    },
};

export const debugstr: Type<Slice> = {
    load(s) {
        const y = uint(4).load(s);
        const realLength = (y + 1) * 8;
        const r = s.loadBits(realLength);
        const b = new CodeBuilder();
        b.storeBits(r);
        return b.asSlice();
    },
    store(b, slice) {
        const length = slice.remainingBits;
        const y = Math.ceil((length - 8) / 8);
        b.storeUint(y, 4);
        b.storeSlice(slice);
    },
};

// TODO: revert
export const refs = (count: number): number => {
    return count;
};

const uint3 = uint(3);
const uint4 = uint(4);
const uint5 = uint(5);
const uint8 = uint(8);
const uint12 = uint(12);

export const control: Type<number> = {
    store: (b, t) => {
        if (t === 6) {
            throw new Error("c6 doesn't exist");
        }
        uint4.store(b, t);
    },
    load: (s) => {
        const r = uint4.load(s);
        if (r === 6) {
            throw new Error("Invalid opcode: c6 doesn't exist");
        }
        return r;
    },
};

export const plduzArg: Type<number> = {
    store: (b, t) => {
        uint3.store(b, ((t >> 5) - 1) & 7);
    },
    load: (s) => ((uint3.load(s) & 7) + 1) << 5,
};

// special case: [-5, 10]
export const tinyInt: Type<number> = {
    store: (b, t) => {
        if (t < -5 || t > 10) {
            throw new Error(`Number must be in range [-5, 10]: ${t}`);
        }
        uint4.store(b, (t + 16) & 15);
    },
    load: (s) => ((uint4.load(s) + 5) & 15) - 5,
};

export const largeInt: Type<bigint> = {
    store: (b, t) => {
        const len = t === 0n ? 1 : t.toString(2).length + (t < 0n ? 0 : 1);
        const len2 = Math.trunc((len + 7) / 8) - 2;
        if (len2 <= 0 || len2 >= 32) {
            // TODO: maybe 52 as in TVM??????????????????
            b.storeUint(t, 24);
            return;
        }
        const countBits = Math.ceil((len - 19) / 8);
        uint5.store(b, countBits);
        const intCountBits = 8 * countBits + 19;
        b.storeInt(t, intCountBits);
    },
    load: (s) => s.loadIntBig(3 + ((uint5.load(s) & 31) + 2) * 8),
};

// special case: RUNVM { ... }
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
export type RunVmArg = number;

export const runvmArg: Type<RunVmArg> = {
    store: (b, t) => {
        uint12.store(b, t);
    },
    load: (s) => uint12.load(s),
};

// special case: CALLXARGS $ -1
export const minusOne: Type<number> = {
    store: (_b, t) => {
        if (t !== -1) {
            throw new Error("This opcode only takes -1");
        }
    },
    load: (_s) => -1,
};

export const s1: Type<number> = {
    store: (_b, t) => {
        if (t !== 1) {
            throw new Error("This opcode only takes s1");
        }
    },
    load: (_s) => 1,
};

export const setcpArg: Type<number> = {
    store: (b, t) => {
        if (t < -15 || t > 239) {
            throw new Error(`Number must be in range [-15, 239]: ${t}`);
        }
        uint4.store(b, (t + 0x10) & 0xff);
    },
    load: (s) => ((uint4.load(s) + 0x10) & 0xff) - 0x10,
};

export const delta = (n: number, ty: Type<number>): Type<number> => ({
    store: (b, t) => {
        ty.store(b, t - n);
    },
    load: (s) => ty.load(s) + n,
});

export const hash: Type<Hash> = {
    store: (b, t) => {
        uint8.store(b, t);
    },
    load: (s) => {
        const r = uint8.load(s);
        if (!(r in Hash)) {
            throw new Error("Wrong hash");
        }
        return r;
    },
};

// TODO: slice
export const PSEUDO_PUSHSLICE: Type<c.PSEUDO_PUSHSLICE> = {
    load: (_s) => {
        throw new Error("unexpected PSEUDO_PUSHSLICE");
    },
    store: (b, val) => {
        b.storeSlice(val.arg0);
    },
};

// TODO: rename to ref
export const PSEUDO_PUSHREF: Type<c.PSEUDO_PUSHREF> = {
    load: (_s) => {
        throw new Error("unexpected PSEUDO_PUSHREF");
    },
    store: (b, val) => {
        if (val.arg0.$ === "Raw") {
            b.storeRef(val.arg0.slice.asCell());
        } else {
            const [cell, mapping] = compileCellWithMapping(
                val.arg0.instructions,
            );

            // implicit JMPREF
            mapping.instructions.splice(0, 0, {
                offset: 0,
                instr: JMPREF(val.arg0, val.loc),
                debugSection: -1,
            });

            b.storeRefWithMapping([cell, mapping]);
        }
    },
};

// TODO: exotic
export const PSEUDO_EXOTIC: Type<c.PSEUDO_EXOTIC> = {
    load: (_s) => {
        throw new Error("unexpected PSEUDO_EXOTIC");
    },
    store: (b, val) => {
        exotic.store(b, val.arg0);
    },
};

export const hex = (value: string): Slice => {
    const b = new CodeBuilder();

    let res = "";
    for (const ch of value) {
        if (ch === "_") break;
        res += Number.parseInt(ch, 16).toString(2).padStart(4, "0");
    }

    if (value.endsWith("_")) {
        res = res.replace(/10*$/, ""); // TODO: rewrite
    }

    for (const ch of res) {
        b.storeBit(ch === "1");
    }

    return b.asSlice();
};

export const bin = (value: string): Slice => {
    const b = new CodeBuilder();
    for (const ch of value) {
        b.storeBit(ch === "1");
    }
    return b.asSlice();
};

// TODO: currently we don't have binary compatibility with BoCs, only with cells
export const boc = (value: string): Slice => {
    return Cell.fromHex(value).asSlice();
};

// TODO: add libraryCell etc.
export const exoticCellBody = (value: string): Cell => {
    const slice = hex(value);

    const bits = slice.loadBits(slice.remainingBits);
    return new Cell({
        exotic: true,
        bits,
        refs: [],
    });
};

export type ExoticCell = DefaultExoticCell | LibraryCell;

export type DefaultExoticCell = {
    readonly $: "DefaultExoticCell";
    readonly cell: Cell;
};

export const DefaultExoticCell = (cell: Cell): DefaultExoticCell => ({
    $: "DefaultExoticCell",
    cell,
});

export type LibraryCell = {
    readonly $: "LibraryCell";
    readonly data: Slice;
};

export const LibraryCell = (data: Slice): LibraryCell => ({
    $: "LibraryCell",
    data,
});

export const exotic: Type<ExoticCell> = {
    load: (s) => {
        const cell = s.asCell();
        const type = s.loadUint(8);
        if (type === 2) {
            return LibraryCell(s);
        }
        return DefaultExoticCell(cell);
    },
    store: (b, t) => {
        if (t.$ === "DefaultExoticCell") {
            b.storeSlice(t.cell.asSlice());
            return;
        }

        b.storeUint(2, 8); // cell type
        b.storeSlice(t.data);
    },
};
