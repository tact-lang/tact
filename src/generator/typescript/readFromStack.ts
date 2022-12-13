import { TypeRef } from "../../types/types";
import { Writer } from "../Writer";

export function readFromStack(name: string, ref: TypeRef, w: Writer) {

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
        } else {
            w.append(`const ${name} = unpackStack${ref.name}(slice);`);
            return;
        }
    }

    if (ref.kind === 'map') {
        w.append(`const ${name} = slice.readCellOpt();`);
        return;
    }

    throw Error('Unsupported type');
}