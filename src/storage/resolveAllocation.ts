import { CompilerContext, createContextStore } from "../context";
import { getAllTypes, getType, toBounced } from "../types/resolveDescriptors";
import { TypeDescription } from "../types/types";
import { topologicalSort } from "../utils/utils";
import { StorageAllocation } from "./StorageAllocation";
import { AllocationOperation } from "./operation";
import { allocate, getAllocationOperationFromField } from "./allocator";
import { createABITypeRefFromTypeRef } from "../types/resolveABITypeRef";
import { initId } from "../generator/writers/id";

let store = createContextStore<StorageAllocation>();

export function getAllocation(ctx: CompilerContext, name: string) {
    let t = store.get(ctx, name);
    if (!t) {
        throw Error('Allocation for ' + name + ' not found');
    }
    return t;
}

export function getAllocations(ctx: CompilerContext) {
    return getSortedTypes(ctx).map((v) => ({ allocation: getAllocation(ctx, v.name), type: v }));
}

export function getSortedTypes(ctx: CompilerContext) {
    let types = Object.values(getAllTypes(ctx)).filter((v) => v.kind === 'struct' || v.kind === 'contract');
    let structs = types.filter(t => t.kind === 'struct');
    let refs = (src: TypeDescription) => {
        let res: TypeDescription[] = []
        let t = new Set<string>();
        for (let f of src.fields) {
            let r = f.type;
            if (r.kind === 'ref') {
                let tp = getType(ctx, r.name);
                if (tp.kind === 'struct') {
                    if (!t.has(tp.name)) {
                        t.add(r.name);
                        res.push(tp);
                    }
                }
            }
        }
        return res;
    }
    structs = topologicalSort(structs, refs);
    structs = [...structs, ...types.filter((v) => v.kind === 'contract')];
    return structs;
}

export function resolveAllocations(ctx: CompilerContext) {

    // Load topological order of structs and contracts
    let types = getSortedTypes(ctx);

    // Generate allocations
    for (let s of types) {

        // Reserve bits
        let reserveBits = 0;
        let header: { value: number, bits: number } | null = null;
        if (s.header !== null) {
            reserveBits += 32; // Header size
            header = { value: s.header, bits: 32 };
        }

        // Reserver refs
        let reserveRefs = 0;
        if (s.kind === 'contract') {
            reserveRefs += 1; // Internal state
        }

        // Convert fields
        let ops: AllocationOperation[] = [];
        let partialOps: AllocationOperation[] = [];
        for (let [i, f] of s.fields.entries()) {
            const op = {
                name: f.name,
                type: f.abi.type,
                op: getAllocationOperationFromField(f.abi.type, (name) => getAllocation(ctx, name)!.size)
            };
            ops.push(op);
            if (i < s.partialFieldCount) {
                partialOps.push(op);
            }
        }

        // Perform allocation
        let root = allocate({ ops, reserved: { bits: reserveBits, refs: reserveRefs } });
        let partialRoot = allocate({ ops: partialOps, reserved: { bits: reserveBits, refs: reserveRefs } });

        // Store allocation
        let allocation: StorageAllocation = {
            ops,
            root,
            header,
            size: {
                bits: root.size.bits + reserveBits,
                refs: root.size.refs + reserveRefs
            }
        };
        
        let partialAllocation: StorageAllocation = {
            ops: partialOps,
            root: partialRoot,
            header,
            size: {
                bits: root.size.bits + reserveBits,
                refs: root.size.refs + reserveRefs
            }
        };
        
        ctx = store.set(ctx, s.name, allocation);
        ctx = store.set(ctx, toBounced(s.name), partialAllocation);
    }
    
    // Generate init allocations
    for (let s of types) {
        if (s.kind === 'contract' && s.init) {

            // Reserve bits and refs
            let reserveBits = 0;
            let reserveRefs = 0;

            // Reserve first bit for init state
            reserveBits++;

            // Reserve ref for system cell
            reserveRefs++;

            // Resolve opts
            let ops: AllocationOperation[] = [];
            for (let f of s.init.args) {
                let abiType = createABITypeRefFromTypeRef(f.type, f.ref);
                ops.push({
                    name: f.name,
                    type: abiType,
                    op: getAllocationOperationFromField(abiType, (name) => getAllocation(ctx, name)!.size)
                });
            }

            // Perform allocation
            let root = allocate({ ops, reserved: { bits: reserveBits, refs: reserveRefs } }); // Better allocation?

            // Store allocation
            let allocation: StorageAllocation = {
                ops,
                root,
                header: null,
                size: {
                    bits: root.size.bits + reserveBits,
                    refs: root.size.refs + reserveRefs
                }
            };
            ctx = store.set(ctx, initId(s.name), allocation);
        }
    }

    return ctx;
}