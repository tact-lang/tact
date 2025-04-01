import { Dictionary } from "@/core";

export type ExtraCurrency = Record<number, bigint>;

export function extractEc(cc: Dictionary<number, bigint>): ExtraCurrency {
    const r: ExtraCurrency = {};
    for (const [k, v] of cc) {
        r[k] = v;
    }
    return r;
}

export function packEc(
    ec: Iterable<[number, bigint]>,
): Dictionary<number, bigint> {
    const r: Dictionary<number, bigint> = Dictionary.empty(
        Dictionary.Keys.Uint(32),
        Dictionary.Values.BigVarUint(5),
    );
    for (const [k, v] of ec) {
        r.set(k, v);
    }
    return r;
}
