import { TypeDescription } from "../types/types";
import { AllocationCell } from "./operation";

export type StorageAllocation = {
    type: TypeDescription;
    root: AllocationCell;
    size: { bits: number, refs: number };
};