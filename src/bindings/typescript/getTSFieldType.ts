import { ABITypeRef } from "ton-core";

export function getTSFieldType(ref: ABITypeRef): string {
    if (ref.kind === 'simple') {
        if (ref.type === 'int' || ref.type === 'uint') {
            return 'bigint' + (ref.optional ? ' | null' : '');
        } else if (ref.type === 'bool') {
            return 'boolean' + (ref.optional ? ' | null' : '');
        } else if (ref.type === 'cell' || ref.type === 'slice' || ref.type === 'builder') {
            return 'Cell' + (ref.optional ? ' | null' : '');
        } else if (ref.type === 'address') {
            return 'Address' + (ref.optional ? ' | null' : '');
        } else if (ref.type === 'string') {
            return 'string' + (ref.optional ? ' | null' : '');
        } else {
            return ref.type + (ref.optional ? ' | null' : '');
        }
    }
    if (ref.kind === 'dict') {
        return `Cell`;
    }

    throw Error(`Unsupported type`);
}