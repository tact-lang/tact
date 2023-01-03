import { TypeRef } from "../../types/types";
import { Writer } from "../../utils/Writer";

export function readFromStack(name: string, ref: TypeRef, w: Writer, forceTuple: boolean = false) {

    if (ref.kind === 'ref') {
        if (ref.name === 'Int') {
            if (ref.optional) {
                w.append(`const ${name} = slice.readBigNumberOpt();`);
            } else {
                w.append(`const ${name} = slice.readBigNumber();`);
            }
            return;
        } else if (ref.name === 'Bool') {
            if (ref.optional) {
                w.append(`const ${name} = slice.readBooleanOpt();`);
            } else {
                w.append(`const ${name} = slice.readBoolean();`);
            }
            return;
        } else if (ref.name === 'Address') {
            if (ref.optional) {
                w.append(`const ${name} = slice.readAddressOpt();`);
            } else {
                w.append(`const ${name} = slice.readAddress();`);
            }
            return;
        } else if (ref.name === 'Cell' || ref.name === 'Slice' || ref.name === 'Builder') {
            if (ref.optional) {
                w.append(`const ${name} = slice.readCellOpt();`);
            } else {
                w.append(`const ${name} = slice.readCell();`);
            }
            return;
        } else if (ref.name === 'String') {
            if (ref.optional) {
                w.append(`const ${name} = slice.readCell().beginParse().loadStringTail();`);
            } else {
                w.append(`const ${name} = slice.readCell().beginParse().loadStringTail();`);
            }
        } else {
            if (ref.optional) {
                w.append(`const ${name}_p = slice.pop();`);
                w.append(`const ${name} = ${name}_p.type !== 'tuple' ? null : unpackTuple${ref.name}(new TupleReader(${name}_p.items));`);
            } else if (forceTuple) {
                w.append(`const ${name} = unpackTuple${ref.name}(slice);`);
            } else {
                w.append(`const ${name} = unpackStack${ref.name}(slice);`);
            }
            return;
        }
    }

    if (ref.kind === 'map') {
        w.append(`const ${name} = slice.readCellOpt();`);
        return;
    }

    throw Error('Unsupported type');
}