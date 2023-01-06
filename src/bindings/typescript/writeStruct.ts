import { ABIField, ABIType } from "ton-core";
import { Serializer, serializers } from "../../serializer/serializers";
import { AllocationCell } from "../../storage/operation";
import { Writer } from "../../utils/Writer";
import { getTSFieldType } from "./getTSFieldType";

export function writeStruct(s: ABIType, w: Writer) {
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

export function writeParser(s: ABIType, allocation: AllocationCell, w: Writer) {
    w.append(`export function load${s.name}(slice: Slice) {`);
    w.inIndent(() => {
        w.append(`let sc_0 = slice;`);
        if (s.header) {
            w.append(`if (sc_0.loadUint(32) !== ${s.header}) { throw Error('Invalid prefix'); }`);
        }
        writeParserCell(0, 0, allocation, s, w);
        w.append(`return { ${[`$$type: '${s.name}' as const`, ...s.fields.map((v) => v.name + ': _' + v.name)].join(', ')} };`);
    });
    w.append(`}`);
    w.append();
}

function writeParserCell(gen: number, offset: number, src: AllocationCell, s: ABIType, w: Writer) {
    for (let f of src.ops) {
        writeParserField(gen, offset++, s, w);
    }
    if (src.next) {
        w.append(`let sc_${gen + 1} = sc_${gen}.loadRef().beginParse();`);
        writeParserCell(gen + 1, offset, src.next, s, w);
    }
}

function writeParserField(gen: number, offset: number, s: ABIType, w: Writer) {
    let name = '_' + s.fields[offset].name;
    let type = s.fields[offset].type;

    //
    // Default serializers
    //

    for (let s of serializers) {
        let v = s.abiMatcher(type);
        if (v) {
            s.tsLoad(v, `sc_${gen}`, name, w);
            return;
        }
    }

    //
    // Struct serializer
    //

    if (type.kind === 'simple') {
        if (type.format !== null && type.format !== undefined) {
            throw Error('Unsupported ' + type.type + ' format: ' + type.format);
        }
        if (type.optional) {
            w.append(`${name} = sc_${gen}.loadBit() ? load${type.type}(sc_${gen}) : null;`);
        } else {
            w.append(`${name} = load${type.type}(sc_${gen});`);
        }
        return;
    }


    //
    // Dict serializer
    //

    if (type.kind === 'map') {
        if (type.format !== null && type.format !== undefined) {
            throw Error('Unsupported map format: ' + type.format);
        }
        w.append(`${name} = sc_${gen}.loadMaybeCell();`);
        return;
    }

    throw Error('Unsupported type');
}

export function writeSerializer(s: ABIType, allocation: AllocationCell, w: Writer) {
    w.append(`export function store${s.name}(src: ${s.name}) {`);
    w.inIndent(() => {
        w.append(`return (builder: Builder) => {`)
        w.inIndent(() => {
            w.append(`let b_0 = builder;`);
            if (s.header) {
                w.append(`b_0.storeUint(${s.header}, 32);`);
            }
            writeSerializerCell(0, 0, allocation, s, w);
        });
        w.append(`};`);
    });
    w.append(`}`);
    w.append();
}

function writeSerializerCell(gen: number, offset: number, src: AllocationCell, s: ABIType, w: Writer) {
    for (let f of src.ops) {
        writeSerializerField(gen, offset++, s, w);
    }
    if (src.next) {
        w.append(`let b_${gen + 1} = new Builder();`);
        writeSerializerCell(gen + 1, offset, src.next, s, w);
        w.append(`b_${gen}.storeRef(b_${gen + 1}.endCell());`);
    }
}

function writeSerializerField(gen: number, offset: number, s: ABIType, w: Writer) {
    let name = 'src.' + s.fields[offset].name;
    let type = s.fields[offset].type;

    //
    // Default Serializers
    //

    for (let s of serializers) {
        let v = s.abiMatcher(type);
        if (v) {
            s.tsStore(v, `b_${gen}`, name, w);
            return;
        }
    }

    //
    // Struct serializer
    //

    if (type.kind === 'simple') {
        if (type.format !== null && type.format !== undefined) {
            throw Error('Unsupported struct format: ' + type.format);
        }
        if (type.optional) {
            w.append(`if (${name} !== null) { b_${gen}.storeBit(true); store${type.type}(${name}, b_${gen}); } else { b_${gen}.storeBit(false); }`);
        } else {
            w.append(`store${type.type}(${name}, b_${gen});`);
        }
        return;
    }

    //
    // Map serializer
    //

    if (type.kind === 'map') {
        if (type.format !== null && type.format !== undefined) {
            throw Error('Unsupported map format: ' + type.format);
        }
        w.append(`b_${gen}.storeMaybeCell(${name});`);
        return;
    }

    //
    // Unsupported
    //

    throw Error('Unsupported field type');
}

// export function writeTupleParser(s: ContractStruct, w: Writer) {
//     w.append(`function loadTuple${s.name}(source: TupleReader) {`);
//     w.inIndent(() => {
//         for (let f of s.fields) {
//             writeTupleFieldParser(f, s, w);
//         }
//         w.append(`return { ${[`$$type: '${s.name}' as const`, ...s.fields.map((v) => v.name + ': _' + v.name)].join(', ')} };`);
//     });
//     w.append(`}`);
//     w.append();
// }

// function writeTupleFieldParser(f: ContractField, s: ContractStruct, w: Writer) {
//     let name = `_${f.name}`;
//     if (f.type.kind === 'ref') {
//         if (f.type.name === 'Int') {
//             if (f.type.optional) {
//                 w.append(`const ${name} = source.readBigNumberOpt();`);
//             } else {
//                 w.append(`const ${name} = source.readBigNumber();`);
//             }
//             return;
//         } else if (f.type.name === 'Bool') {
//             if (f.type.optional) {
//                 w.append(`const ${name} = source.readBooleanOpt();`);
//             } else {
//                 w.append(`const ${name} = source.readBoolean();`);
//             }
//             return;
//         } else if (f.type.name === 'Address') {
//             if (f.type.optional) {
//                 w.append(`const ${name} = source.readAddressOpt();`);
//             } else {
//                 w.append(`const ${name} = source.readAddress();`);
//             }
//             return;
//         } else if (f.type.name === 'Cell' || f.type.name === 'Slice' || f.type.name === 'Builder') {
//             if (f.type.optional) {
//                 w.append(`const ${name} = source.readCellOpt();`);
//             } else {
//                 w.append(`const ${name} = source.readCell();`);
//             }
//             return;
//         } else if (f.type.name === 'String') {
//             if (f.type.optional) {
//                 w.append(`const ${name} = source.readCell().beginParse().loadStringTail();`);
//             } else {
//                 w.append(`const ${name} = source.readCell().beginParse().loadStringTail();`);
//             }
//         } else {
//             if (f.type.optional) {
//                 w.append(`const ${name}_p = source.readTupleOpt();`);
//                 w.append(`const ${name} = ${name}_p ? loadTuple${f.type.name}(${name}_p) : null;`);
//             } else {
//                 w.append(`const ${name} = loadTuple${f.type.name}(source.readTuple());`);
//             }
//             return;
//         }
//     }

//     if (f.type.kind === 'map') {
//         w.append(`const ${name} = slice.readCellOpt();`);
//         return;
//     }

//     throw Error('Unsupported type');
// }

// export function writeTupleSerializer(s: ABIType, w: Writer) {
//     w.append(`function storeTuple${s.name}(source: ${s.name}) {`);
//     w.inIndent(() => {
//         w.append(`let __tuple: TupleItem[] = [];`);
//         for (let f of s.fields) {
//             writeVariableToStack(`source.${f.name}`, f.type, w);
//         }
//         w.append(`return __tuple;`);
//     });
//     w.append(`}`);
//     w.append();
// }

// export function writeArgumentToStack(name: string, ref: ABITypeRef, w: Writer) {
//     writeVariableToStack(name, ref, w);
// }

// function writeVariableToStack(name: string, ref: ABITypeRef, w: Writer) {

//     //
//     // Reference
//     //

//     if (ref.kind === 'simple') {
//         if (ref.optional) {
//             w.append(`if (${name} !== null) {`);
//             w.inIndent(() => {
//                 writeVariableToStack(name, { ...ref, optional: false }, w);
//             });
//             w.append('} else {');
//             w.inIndent(() => {
//                 w.append(`__tuple.push({ type: 'null' });`);
//             });
//             w.append('}');
//             return;
//         }

//         if (ref.type === 'int') {
//             w.append(`__tuple.push({ type: 'int', value: ${name} });`);
//             return;
//         } else if (ref.type === 'bool') {
//             w.append(`__tuple.push({ type: 'int', value: ${name} ? -1n : 0n });`);
//             return;
//         } else if (ref.type === 'cell') {
//             w.append(`__tuple.push({ type: 'cell', cell: ${name} });`);
//             return;
//         } else if (ref.type === 'slice') {
//             w.append(`__tuple.push({ type: 'slice', cell: ${name} });`);
//             return;
//         } else if (ref.type === 'builder') {
//             w.append(`__tuple.push({ type: 'builder', cell: ${name} });`);
//             return;
//         } else if (ref.type === 'address') {
//             w.append(`__tuple.push({ type: 'slice', cell: beginCell().storeAddress(${name}).endCell() });`);
//             return;
//         } else if (ref.type === 'string') {
//             w.append(`__tuple.push({ type: 'slice', cell: beginCell().storeStringTail(${name}).endCell() });`);
//             return;
//         } else {
//             w.append(`__tuple.push({ type: 'tuple', items: storeTuple${ref.type}(${name}) });`);
//             return;
//         }
//     }

//     //
//     // Map
//     //

//     if (ref.kind === 'map') {
//         w.append(`__tuple.push({ type: 'cell', cell: ${name} });`);
//         return;
//     }

//     throw Error(`Unsupported type`);
// }