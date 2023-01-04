import { AllocationCell, AllocationField, ContractField, ContractStruct } from "../../abi/ContractABI";
import { Writer } from "../../utils/Writer";
import { getTSFieldType } from "./getTSFieldType";

export function writeStruct(s: ContractStruct, w: Writer) {
    w.append(`export type ${s.name} = {`);
    w.inIndent(() => {
        w.append(`$$type: '${s.name}';`);
        for (let f of s.fields) {
            w.append(`${f.name}: ${getTSFieldType(f.type)};`);
        }
    });
    w.append(`}`);
    w.append();
}

export function writeParser(s: ContractStruct, w: Writer) {
    w.append(`export function load${s.name}(slice: Slice) {`);
    w.inIndent(() => {
        w.append(`let sc_0 = slice;`);
        if (s.allocation.prefix) {
            w.append(`if (sc_0.loadUint(32) !== ${s.allocation.prefix}) { throw Error('Invalid prefix'); }`)
        }
        writeParserCell(0, s.allocation.root, s, w);
        w.append(`return { ${[`$$type: '${s.name}' as const`, ...s.fields.map((v) => v.name + ': _' + v.name)].join(', ')} };`);
    });
    w.append(`}`);
    w.append();
}

function writeParserCell(index: number, src: AllocationCell, s: ContractStruct, w: Writer) {
    for (let f of src.fields) {
        writeParserField(index, f, s, w);
    }
    if (src.next) {
        w.append(`let sc_${index + 1} = sc_${index}.loadRef().beginParse();`);
        writeParserCell(index + 1, src.next, s, w);
    }
}

function writeParserField(index: number, f: AllocationField, s: ContractStruct, w: Writer, fromNullable = false) {

    let name = (fromNullable ? '' : 'let ') + ('_' + s.fields[f.index].name);
    let type = s.fields[f.index].type;

    if (f.kind === 'int') {
        if (f.bits === 1) {
            if (type.kind === 'ref' && type.name === 'Bool') {
                w.append(`${name} = sc_${index}.loadBit();`);
            } else {
                w.append(`${name} = sc_${index}.loadIntBig(1);`);
            }
        } else {
            w.append(`${name} = sc_${index}.loadIntBig(${f.bits});`);
        }
    } else if (f.kind === 'uint') {
        w.append(`${name} = sc_${index}.loadUintBig(${f.bits});`);
    } else if (f.kind === 'coins') {
        w.append(`${name} = sc_${index}.loadCoins();`);
    } else if (f.kind === 'cell') {
        w.append(`${name} = sc_${index}.loadRef();`);
    } else if (f.kind === 'slice') {
        w.append(`${name} = sc_${index}.loadRef();`);
    } else if (f.kind === 'optional') {
        if (f.inner.kind === 'address') {
            w.append(`${name} = sc_${index}.loadMaybeAddress();`);
        } else {
            w.append(`${name}: ${getTSFieldType(type)} = null;`);
            w.append(`if (sc_${index}.loadBit()) {`);
            w.inIndent(() => {
                writeParserField(index, f.inner, s, w, true);
            });
            w.append(`}`);
        }
    } else if (f.kind === 'struct') {
        w.append(`${name} = load${f.type}(sc_${index});`);
    } else if (f.kind === 'address') {
        w.append(`${name} = sc_${index}.loadAddress();`);
    } else if (f.kind === 'remaining') {
        w.append(`${name} = sc_${index}.asCell();`);
    } else if (f.kind === 'bytes') {
        w.append(`${name} = sc_${index}.loadBuffer(${f.size});`);
    } else if (f.kind === 'map') {
        w.append(`${name} = sc_${index}.loadRef();`);
    } else {
        throw Error('Unsupported field type');
    }
}

export function writeSerializer(s: ContractStruct, w: Writer) {
    w.append(`export function store${s.name}(src: ${s.name}) {`);
    w.inIndent(() => {
        w.append(`return (builder: Builder) => {`)
        w.inIndent(() => {
            w.append(`let b_0 = builder;`);
            if (s.allocation.prefix) {
                w.append(`b_0.storeUint(${s.allocation.prefix}, 32);`);
            }
            writeSerializerCell(0, s.allocation.root, s, w);
        });
        w.append(`};`);
    });
    w.append(`}`);
    w.append();
}

function writeSerializerCell(index: number, src: AllocationCell, s: ContractStruct, w: Writer) {
    for (let f of src.fields) {
        writeSerializerField(index, f, s, w);
    }
    if (src.next) {
        w.append(`let b_${index + 1} = new Builder();`);
        writeSerializerCell(index + 1, src.next, s, w);
        w.append(`b_${index}.storeRef(b_${index + 1}.endCell());`);
    }
}

function writeSerializerField(index: number, f: AllocationField, s: ContractStruct, w: Writer) {
    if (f.kind === 'int') {
        if (f.bits === 1) {
            w.append(`b_${index}.storeBit(src.${s.fields[f.index].name});`);
        } else {
            w.append(`b_${index}.storeInt(src.${s.fields[f.index].name}, ${f.bits});`);
        }
    } else if (f.kind === 'uint') {
        w.append(`b_${index}.storeUint(src.${s.fields[f.index].name}, ${f.bits});`);
    } else if (f.kind === 'coins') {
        w.append(`b_${index}.storeCoins(src.${s.fields[f.index].name});`);
    } else if (f.kind === 'cell') {
        w.append(`b_${index}.storeRef(src.${s.fields[f.index].name});`);
    } else if (f.kind === 'slice') {
        w.append(`b_${index}.storeRef(src.${s.fields[f.index].name});`);
    } else if (f.kind === 'optional') {
        if (f.inner.kind === 'address') {
            w.append(`b_${index}.storeAddress(src.${s.fields[f.index].name});`);
        } else {
            w.append(`if (src.${s.fields[f.index].name} !== null) {`);
            w.inIndent(() => {
                w.append(`b_${index}.storeBit(true);`);
                writeSerializerField(index, f.inner, s, w);
            });
            w.append(`} else {`);
            w.inIndent(() => {
                w.append(`b_${index}.storeBit(false);`);
            });
            w.append(`}`);
        }
    } else if (f.kind === 'struct') {
        w.append(`b_${index}.store(store${f.type}(src.${s.fields[f.index].name}));`);
    } else if (f.kind === 'address') {
        w.append(`b_${index}.storeAddress(src.${s.fields[f.index].name});`);
    } else if (f.kind === 'remaining') {
        w.append(`b_${index}.storeSlice(src.${s.fields[f.index].name}.beginParse());`);
    } else if (f.kind === 'bytes') {
        w.append(`b_${index}.storeSlice(src.${s.fields[f.index].name});`);
    } else if (f.kind === 'map') {
        w.append(`b_${index}.storeDict(src.${s.fields[f.index].name});`);
    } else {
        throw Error('Unsupported field type');
    }
}

function writeTupleFieldParser(f: ContractField, s: ContractStruct, w: Writer) {
    let name = `_${f.name}`;
    if (f.type.kind === 'ref') {
        if (f.type.name === 'Int') {
            if (f.type.optional) {
                w.append(`const ${name} = source.readBigNumberOpt();`);
            } else {
                w.append(`const ${name} = source.readBigNumber();`);
            }
            return;
        } else if (f.type.name === 'Bool') {
            if (f.type.optional) {
                w.append(`const ${name} = source.readBooleanOpt();`);
            } else {
                w.append(`const ${name} = source.readBoolean();`);
            }
            return;
        } else if (f.type.name === 'Address') {
            if (f.type.optional) {
                w.append(`const ${name} = source.readAddressOpt();`);
            } else {
                w.append(`const ${name} = source.readAddress();`);
            }
            return;
        } else if (f.type.name === 'Cell' || f.type.name === 'Slice' || f.type.name === 'Builder') {
            if (f.type.optional) {
                w.append(`const ${name} = source.readCellOpt();`);
            } else {
                w.append(`const ${name} = source.readCell();`);
            }
            return;
        } else if (f.type.name === 'String') {
            if (f.type.optional) {
                w.append(`const ${name} = source.readCell().beginParse().loadStringTail();`);
            } else {
                w.append(`const ${name} = source.readCell().beginParse().loadStringTail();`);
            }
        } else {
            if (f.type.optional) {
                w.append(`const ${name}_p = source.readTupleOpt();`);
                w.append(`const ${name} = ${name}_p ? loadTuple${f.type.name}(${name}_p) : null;`);
            } else {
                w.append(`const ${name} = loadTuple${f.type.name}(source.readTuple());`);
            }
            return;
        }
    }

    if (f.type.kind === 'map') {
        w.append(`const ${name} = slice.readCellOpt();`);
        return;
    }

    throw Error('Unsupported type');
}

export function writeTupleParser(s: ContractStruct, w: Writer) {
    w.append(`function loadTuple${s.name}(source: TupleReader) {`);
    w.inIndent(() => {
        for (let f of s.fields) {
            writeTupleFieldParser(f, s, w);
        }
        w.append(`return { ${[`$$type: '${s.name}' as const`, ...s.fields.map((v) => v.name + ': _' + v.name)].join(', ')} };`);
    });
    w.append(`}`);
    w.append();
}