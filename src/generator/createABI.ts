import { Allocation, AllocationCell, AllocationField, ContractABI, ContractInit, ContractStruct, CotnractFunction } from "../abi/ContractABI";
import { CompilerContext } from "../context";
import { getAllocation } from "../storage/resolveAllocation";
import { StorageAllocation, StorageCell, StorageField } from "../storage/StorageAllocation";
import { getAllTypes } from "../types/resolveDescriptors";

function createAbiAllocationField(src: StorageField): AllocationField {
    if (src.kind === 'optional') {
        return {
            index: src.index,
            size: src.size,
            kind: src.kind,
            inner: createAbiAllocationField(src.inner)
        };
    } else if (src.kind === 'int' || src.kind === 'uint') {
        return {
            index: src.index,
            size: src.size,
            kind: src.kind,
            bits: src.bits
        };
    } else if (src.kind === 'coins' || src.kind === 'address' || src.kind === 'cell' || src.kind === 'slice') {
        return {
            index: src.index,
            size: src.size,
            kind: src.kind
        };
    } else if (src.kind === 'struct') {
        return {
            index: src.index,
            size: src.size,
            kind: src.kind,
            type: src.type.name
        };
    } else {
        throw Error('Unknown kind');
    }
}

function createAbiAllocationCell(src: StorageCell): AllocationCell {
    return {
        fields: src.fields.map(createAbiAllocationField),
        next: src.next ? createAbiAllocationCell(src.next) : null,
        size: src.size
    };
}

function createAbiAllocation(src: StorageAllocation): Allocation {
    return {
        prefix: src.prefix,
        root: createAbiAllocationCell(src.root)
    };
}

export function createABI(ctx: CompilerContext): ContractABI {

    let allTypes = Object.values(getAllTypes(ctx));

    // Contract
    let contract = allTypes.find((v) => v.kind === 'contract')!;
    if (contract.kind !== 'contract') {
        throw Error('Not a contract');
    }

    // Structs
    let structs: ContractStruct[] = [];
    for (let t of allTypes) {
        if (t.kind === 'struct') {
            structs.push({ name: t.name, header: 0, fields: t.fields.map((v) => ({ name: v.name, type: v.type })), allocation: createAbiAllocation(getAllocation(ctx, t.name)) });
        }
    }

    // Init
    let init: ContractInit | null = null;
    if (contract.init) {
        init = { name: 'init_' + contract.name, args: contract.init.args.map((v) => ({ name: v.name, type: v.type })) };
    }

    // Receivers
    let receivers: string[] = [];
    for (let r of contract.receivers) {
        receivers.push(r.type);
    }

    // Getters
    let getters: CotnractFunction[] = [];
    for (let f of contract.functions) {
        if (f.isGetter) {
            getters.push({
                name: f.name,
                args: f.args.map((v) => ({ name: v.name, type: v.type })),
                returns: f.returns
            });
        }
    }

    return {
        name: contract.name,
        structs,
        init,
        receivers,
        getters
    };
}