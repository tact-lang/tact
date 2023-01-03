import { TypeRef } from "../../types/types";

export function getTSFieldType(ref: TypeRef): string {
    if (ref.kind === 'ref') {
        if (ref.name === 'Int') {
            return 'bigint' + (ref.optional ? ' | null' : '');
        } else if (ref.name === 'Bool') {
            return 'boolean' + (ref.optional ? ' | null' : '');
        } else if (ref.name === 'Cell' || ref.name === 'Slice' || ref.name === 'Builder') {
            return 'Cell' + (ref.optional ? ' | null' : '');
        } else if (ref.name === 'Address') {
            return 'Address' + (ref.optional ? ' | null' : '');
        } else if (ref.name === 'String') {
            return 'string' + (ref.optional ? ' | null' : '');
        } else {
            return ref.name + (ref.optional ? ' | null' : '');
        }
    }
    if (ref.kind === 'map') {
        return `Cell`;
    }

    throw Error(`Unsupported type`);
}