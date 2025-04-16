// https://github.com/ton-blockchain/stablecoin-contract/blob/main/gasUtils.ts
import {
    beginCell,
    Dictionary,
    type Cell,
    type DictionaryValue,
} from "@ton/core";
import type { BlockchainConfig } from "@ton/sandbox";

type StorageValue = {
    unix_time_since: number;
    bit_price_ps: bigint;
    cell_price_ps: bigint;
    mc_bit_price_ps: bigint;
    mc_cell_price_ps: bigint;
};

const storageValue: DictionaryValue<StorageValue> = {
    serialize: (src, builder) => {
        builder
            .storeUint(0xcc, 8)
            .storeUint(src.unix_time_since, 32)
            .storeUint(src.bit_price_ps, 64)
            .storeUint(src.cell_price_ps, 64)
            .storeUint(src.mc_bit_price_ps, 64)
            .storeUint(src.mc_cell_price_ps, 64);
    },
    parse: (src) => {
        return {
            unix_time_since: src.skip(8).loadUint(32),
            bit_price_ps: src.loadUintBig(64),
            cell_price_ps: src.loadUintBig(64),
            mc_bit_price_ps: src.loadUintBig(64),
            mc_cell_price_ps: src.loadUintBig(64),
        };
    },
};

export function setStoragePrices(
    configRaw: Cell,
    prices: StorageValue,
): BlockchainConfig {
    const config = configRaw
        .beginParse()
        .loadDictDirect(Dictionary.Keys.Int(32), Dictionary.Values.Cell());
    const storageData = Dictionary.loadDirect(
        Dictionary.Keys.Uint(32),
        storageValue,
        config.get(18)!,
    );
    storageData.set(storageData.values().length - 1, prices);
    config.set(18, beginCell().storeDictDirect(storageData).endCell());
    return beginCell().storeDictDirect(config).endCell();
}
