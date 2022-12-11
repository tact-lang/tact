import { Allocation, AllocationCell, AllocationField, ContractABI, ContractInit, ContractReceiver, ContractStruct, CotnractFunction } from "../abi/ContractABI";
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
    } else if (src.kind === 'remaining') {
        return {
            index: src.index,
            size: src.size,
            kind: src.kind
        };
    } else if (src.kind === 'bytes') {
        return {
            index: src.index,
            size: src.size,
            kind: src.kind,
            bytes: src.bytes
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
    let receivers: ContractReceiver[] = [];
    for (let r of Object.values(contract.receivers)) {
        if (r.selector.kind === 'internal-binary') {
            receivers.push({
                kind: 'internal-binary',
                type: r.selector.type
            });
        } else if (r.selector.kind === 'internal-empty') {
            receivers.push({
                kind: 'internal-empty'
            });
        } else if (r.selector.kind === 'internal-comment') {
            receivers.push({
                kind: 'internal-comment',
                comment: r.selector.comment
            });
        } else if (r.selector.kind === 'internal-fallback') {
            receivers.push({
                kind: 'internal-fallback'
            });
        }
    }

    // Getters
    let getters: CotnractFunction[] = [];
    for (let f of Object.values(contract.functions)) {
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