import { ABIType, ABITypeRef } from "@ton/core";
import { serializers } from "./serializers";
import { AllocationCell, AllocationOperation } from "../../storage/operation";
import { Writer } from "../../utils/Writer";

export function writeStruct(
    name: string,
    fields: { name: string; type: ABITypeRef }[],
    exp: boolean,
    w: Writer,
) {
    w.append(`${exp ? "export " : " "}type ${name} = {`);
    w.inIndent(() => {
        w.append(`$$type: '${name}';`);
        outer: for (const f of fields) {
            for (const s of serializers) {
                const v = s.abiMatcher(f.type);
                if (v) {
                    w.append(`${f.name}: ${s.tsType(v)};`);
                    continue outer;
                }
            }

            throw Error("Unsupported type: " + JSON.stringify(f.type));
        }
    });
    w.append(`}`);
    w.append();
}

export function writeParser(s: ABIType, allocation: AllocationCell, w: Writer) {
    w.append(`export function load${s.name}(slice: Slice) {`);
    w.inIndent(() => {
        w.append(`let sc_0 = slice;`);
        if (s.header) {
            w.append(
                `if (sc_0.loadUint(32) !== ${s.header}) { throw Error('Invalid prefix'); }`,
            );
        }
        writeParserCell(0, allocation, s, w);
        w.append(
            `return { ${[`$$type: '${s.name}' as const`, ...s.fields.map((v) => v.name + ": _" + v.name)].join(", ")} };`,
        );
    });
    w.append(`}`);
    w.append();
}

function writeParserCell(
    gen: number,
    src: AllocationCell,
    s: ABIType,
    w: Writer,
) {
    for (const f of src.ops) {
        writeParserField(gen, f, s, w);
    }
    if (src.next) {
        w.append(`let sc_${gen + 1} = sc_${gen}.loadRef().beginParse();`);
        writeParserCell(gen + 1, src.next, s, w);
    }
}

function writeParserField(
    gen: number,
    field: AllocationOperation,
    s: ABIType,
    w: Writer,
) {
    const name = "_" + field.name;
    const type = field.type;
    for (const s of serializers) {
        const v = s.abiMatcher(type);
        if (v) {
            s.tsLoad(v, `sc_${gen}`, name, w);
            return;
        }
    }
    throw Error("Unsupported type");
}

export function writeSerializer(
    s: ABIType,
    allocation: AllocationCell,
    w: Writer,
) {
    w.append(`export function store${s.name}(src: ${s.name}) {`);
    w.inIndent(() => {
        w.append(`return (builder: Builder) => {`);
        w.inIndent(() => {
            w.append(`let b_0 = builder;`);
            if (s.header) {
                w.append(`b_0.storeUint(${s.header}, 32);`);
            }
            writeSerializerCell(0, allocation, w);
        });
        w.append(`};`);
    });
    w.append(`}`);
    w.append();
}

export function writeInitSerializer(
    name: string,
    allocation: AllocationCell,
    w: Writer,
) {
    w.append(`function init${name}(src: ${name}) {`);
    w.inIndent(() => {
        w.append(`return (builder: Builder) => {`);
        w.inIndent(() => {
            w.append(`let b_0 = builder;`);
            writeSerializerCell(0, allocation, w);
        });
        w.append(`};`);
    });
    w.append(`}`);
    w.append();
}

function writeSerializerCell(gen: number, src: AllocationCell, w: Writer) {
    for (const f of src.ops) {
        writeSerializerField(gen, f, w);
    }
    if (src.next) {
        w.append(`let b_${gen + 1} = new Builder();`);
        writeSerializerCell(gen + 1, src.next, w);
        w.append(`b_${gen}.storeRef(b_${gen + 1}.endCell());`);
    }
}

function writeSerializerField(gen: number, s: AllocationOperation, w: Writer) {
    const name = "src." + s.name;
    const type = s.type;
    for (const s of serializers) {
        const v = s.abiMatcher(type);
        if (v) {
            s.tsStore(v, `b_${gen}`, name, w);
            return;
        }
    }
    throw Error("Unsupported field type: " + JSON.stringify(type));
}

export function writeTupleParser(s: ABIType, w: Writer) {
    w.append(`function loadTuple${s.name}(source: TupleReader) {`);
    w.inIndent(() => {
        for (const f of s.fields) {
            writeTupleFieldParser("_" + f.name, f.type, w);
        }
        w.append(
            `return { ${[`$$type: '${s.name}' as const`, ...s.fields.map((v) => v.name + ": _" + v.name)].join(", ")} };`,
        );
    });
    w.append(`}`);
    w.append();
}

export function writeGetParser(name: string, type: ABITypeRef, w: Writer) {
    writeTupleFieldParser(name, type, w, true);
}

function writeTupleFieldParser(
    name: string,
    type: ABITypeRef,
    w: Writer,
    fromGet = false,
) {
    for (const s of serializers) {
        const v = s.abiMatcher(type);
        if (v) {
            s.tsLoadTuple(v, `source`, name, w, fromGet);
            return;
        }
    }
    throw Error("Unsupported field type: " + JSON.stringify(type));
}

export function writeTupleSerializer(s: ABIType, w: Writer) {
    w.append(`function storeTuple${s.name}(source: ${s.name}) {`);
    w.inIndent(() => {
        w.append(`let builder = new TupleBuilder();`);
        for (const f of s.fields) {
            writeVariableToStack(`source.${f.name}`, f.type, w);
        }
        w.append(`return builder.build();`);
    });
    w.append(`}`);
    w.append();
}

export function writeArgumentToStack(name: string, ref: ABITypeRef, w: Writer) {
    writeVariableToStack(name, ref, w);
}

function writeVariableToStack(name: string, type: ABITypeRef, w: Writer) {
    for (const s of serializers) {
        const v = s.abiMatcher(type);
        if (v) {
            s.tsStoreTuple(v, `builder`, name, w);
            return;
        }
    }
    throw Error("Unsupported field type: " + JSON.stringify(type));
}

export function writeDictParser(s: ABIType, w: Writer) {
    w.write(`
        function dictValueParser${s.name}(): DictionaryValue<${s.name}> {
            return {
                serialize: (src, builder) => {
                    builder.storeRef(beginCell().store(store${s.name}(src)).endCell());
                },
                parse: (src) => {
                    return load${s.name}(src.loadRef().beginParse());
                }
            }
        }
    `);
    w.append();
}
