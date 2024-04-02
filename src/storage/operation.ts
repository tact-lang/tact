import { ABITypeRef } from "@ton/core";

export type AllocationCell = {
    ops: AllocationOperation[];
    size: { bits: number; refs: number };
    next: AllocationCell | null;
};

export type AllocationOperation = {
    name: string;
    type: ABITypeRef;
    op: AllocationOperationType;
};

export type AllocationOperationType =
    | {
          kind: "int" | "uint";
          bits: number;
          optional: boolean;
      }
    | {
          kind: "boolean";
          optional: boolean;
      }
    | {
          kind: "coins";
          optional: boolean;
      }
    | {
          kind: "address";
          optional: boolean;
      }
    | {
          kind: "struct";
          type: string;
          ref: boolean;
          optional: boolean;
          size: { bits: number; refs: number };
      }
    | {
          kind: "cell";
          optional: boolean;
          format: "default" | "remainder";
      }
    | {
          kind: "slice";
          optional: boolean;
          format: "default" | "remainder";
      }
    | {
          kind: "builder";
          optional: boolean;
          format: "default" | "remainder";
      }
    | {
          kind: "map";
      }
    | {
          kind: "string";
          optional: boolean;
      }
    | {
          kind: "fixed-bytes";
          bytes: number;
          optional: boolean;
      };
