import type { Builder } from "@/core/boc/builder";
import { beginCell } from "@/core/boc/builder";
import type { Cell } from "@/core/boc/cell";
import type { Slice } from "@/core/boc/slice";
import { Dictionary } from "@/core/dict/dictionary";

export type ExtraCurrency = Record<number, bigint>;

export function loadExtraCurrency(
    data: Slice | Cell | Dictionary<number, bigint>,
) {
    const ecDict =
        data instanceof Dictionary
            ? data
            : Dictionary.loadDirect(
                  Dictionary.Keys.Uint(32),
                  Dictionary.Values.BigVarUint(5),
                  data,
              );
    const ecMap: ExtraCurrency = {};

    for (const [k, v] of ecDict) {
        ecMap[k] = v;
    }

    return ecMap;
}

export function loadMaybeExtraCurrency(data: Slice) {
    const ecData = data.loadMaybeRef();
    return ecData === null ? ecData : loadExtraCurrency(ecData);
}

export function storeExtraCurrency(extracurrency: ExtraCurrency) {
    return (builder: Builder) => {
        builder.storeDict(packExtraCurrencyDict(extracurrency));
    };
}

export function packExtraCurrencyDict(extracurrency: ExtraCurrency) {
    const resEc = Dictionary.empty(
        Dictionary.Keys.Uint(32),
        Dictionary.Values.BigVarUint(5),
    );
    Object.entries(extracurrency).map(([k, v]) => resEc.set(Number(k), v));
    return resEc;
}

export function packExtraCurrencyCell(extracurrency: ExtraCurrency) {
    return beginCell()
        .storeDictDirect(packExtraCurrencyDict(extracurrency))
        .endCell();
}
