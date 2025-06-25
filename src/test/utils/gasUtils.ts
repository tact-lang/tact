import { Dictionary, type Cell } from "@ton/core";
import { updateConfig } from "@ton/sandbox";
import type { StoragePrices } from "@ton/sandbox/dist/config/config.tlb-gen";

export function zeroStoragePrices(configRaw: Cell): Cell {
    return setStoragePrices(configRaw, {
        kind: "StoragePrices",
        utime_since: 0,
        bit_price_ps: 0n,
        _cell_price_ps: 0n,
        mc_bit_price_ps: 0n,
        mc_cell_price_ps: 0n,
    });
}

export function setStoragePrices(configRaw: Cell, prices: StoragePrices): Cell {
    const storagePricesDict = Dictionary.empty<number, StoragePrices>();

    storagePricesDict.set(0, prices);

    const updatedConfig = updateConfig(configRaw, {
        kind: "ConfigParam__18",
        anon0: storagePricesDict,
    });

    return updatedConfig;
}
