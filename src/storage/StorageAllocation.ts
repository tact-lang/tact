import { TypeDescription } from "../types/types";
import { AllocationCell } from "./operation";

export type StorageAllocation = {
    type: TypeDescription;
    header: number | null;
    tlb: string;
    root: AllocationCell;
    size: { bits: number, refs: number };
};