import { TypeDescription } from "../types/types";

export type StorageAllocation = {
    prefix: number | null;
    root: StorageCell;
};

export type StorageCell = {
    fields: StorageField[];
    next: StorageCell | null;
    size: { bits: number, refs: number };
}

export type StorageField = {
    index: number,
    size: { bits: number, refs: number },
    name: string,
    kind: 'int' | 'int-optional' | 'struct' | 'struct-optional' | 'slice' | 'slice-optional',
    type: TypeDescription
}