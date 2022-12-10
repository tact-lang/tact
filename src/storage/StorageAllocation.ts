import { TypeDescription, TypeRef } from "../types/types";

export type StorageAllocation = {
    prefix: number | null;
    root: StorageCell;
    fields: { name: string, type: TypeRef, index: number }[];
};

export type StorageCell = {
    fields: StorageField[];
    next: StorageCell | null;
    size: { bits: number, refs: number };
}

export type StorageField = {
    index: number,
    size: { bits: number, refs: number },
    name: string
} & (
        | { kind: 'int' | 'uint', bits: number }
        | { kind: 'coins' }
        | { kind: 'address' }
        | { kind: 'struct', type: TypeDescription }
        | { kind: 'slice' | 'cell' }
        | { kind: 'optional', inner: StorageField }
        | { kind: 'map' }
        | { kind: 'remaining' }
        | { kind: 'bytes', bytes: number }
    )