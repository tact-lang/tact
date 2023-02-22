import { AllocationCell, AllocationOperation } from "./operation";

export type StorageAllocation = {
    ops: AllocationOperation[];
    size: { bits: number, refs: number };
    root: AllocationCell;
};