import { Allocation, AllocationCell, AllocationField, ContractABI, ContractInit, ContractReceiver, ContractStruct, CotnractFunction } from "../abi/ContractABI";
import { contractErrors } from "../abi/errors";
import { CompilerContext } from "../context";
import { getAllocation } from "../storage/resolveAllocation";
import { StorageAllocation, StorageCell, StorageField } from "../storage/StorageAllocation";
import { getAllTypes } from "../types/resolveDescriptors";
import { getAllErrors } from "../types/resolveStrings";

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
    } else if (src.kind === 'map') {
        return {
            index: src.index,
            size: src.size,
            kind: src.kind
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

export function createABI(ctx: CompilerContext, name: string): ContractABI {

    let allTypes = Object.values(getAllTypes(ctx));

    // Contract
    let contract = allTypes.find((v) => v.name === name)!;
    if (!contract) {
        throw Error(`Contract ${name} not found`);
    }
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
    for (let f of contract.functions.values()) {
        if (f.isGetter) {
            getters.push({
                name: f.name,
                args: f.args.map((v) => ({ name: v.name, type: v.type })),
                returns: f.returns
            });
        }
    }

    // Errors
    let errors: { [key: string]: { message: string } } = {};
    errors['2'] = { message: 'Stack undeflow' };
    errors['3'] = { message: 'Stack overflow' };
    errors['4'] = { message: 'Integer overflow' };
    errors['5'] = { message: 'Integer out of expected range' };
    errors['6'] = { message: 'Invalid opcode' };
    errors['7'] = { message: 'Type check error' };
    errors['8'] = { message: 'Cell overflow' };
    errors['9'] = { message: 'Cell underflow' };
    errors['10'] = { message: 'Dictionary error' };
    errors['13'] = { message: 'Out of gas error' };
    errors['32'] = { message: 'Method ID not found' };
    errors['34'] = { message: 'Action is invalid or not supported' };
    errors['37'] = { message: 'Not enough TON' };
    errors['38'] = { message: 'Not enough extra-currencies' };
    for (let e of Object.values(contractErrors)) {
        errors[e.id] = { message: e.message };
    }
    let codeErrors = getAllErrors(ctx);
    for (let c of codeErrors) {
        errors[c.id + ''] = { message: c.value };
    }

    return {
        version: '0.0.1',
        name: contract.name,
        structs,
        init,
        receivers,
        getters,
        errors
    };
}