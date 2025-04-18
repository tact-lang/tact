// https://github.com/ton-blockchain/stablecoin-contract/blob/main/gasUtils.ts
import {
    beginCell,
    Dictionary,
    type Cell,
    type DictionaryValue,
} from "@ton/core";
import type { BlockchainConfig } from "@ton/sandbox";

// https://github.com/ton-blockchain/ton/blob/ed4682066978f69ffa38dd98912ca77d4f660f66/crypto/block/block.tlb#L705
const ConfigStoragePriceIndex = 18;
const ConfigKeyLength = 32;

type StorageValue = {
    unixTimeSince: number;
    bitPricePerSecond: bigint;
    cellPricePerSecond: bigint;
    masterChainBitPricePerSecond: bigint;
    masterChainCellPricePerSecond: bigint;
};

const storageValue: DictionaryValue<StorageValue> = {
    serialize: (src, builder) => {
        builder
            .storeUint(0xcc, 8)
            .storeUint(src.unixTimeSince, 32)
            .storeUint(src.bitPricePerSecond, 64)
            .storeUint(src.cellPricePerSecond, 64)
            .storeUint(src.masterChainBitPricePerSecond, 64)
            .storeUint(src.masterChainCellPricePerSecond, 64);
    },
    parse: (src) => {
        return {
            unixTimeSince: src.skip(8).loadUint(32),
            bitPricePerSecond: src.loadUintBig(64),
            cellPricePerSecond: src.loadUintBig(64),
            masterChainBitPricePerSecond: src.loadUintBig(64),
            masterChainCellPricePerSecond: src.loadUintBig(64),
        };
    },
};

export function setStoragePrices(
    configRaw: Cell,
    prices: StorageValue,
): BlockchainConfig {
    const config = configRaw
        .beginParse()
        .loadDictDirect(
            Dictionary.Keys.Int(ConfigKeyLength),
            Dictionary.Values.Cell(),
        );
    const storageData = Dictionary.loadDirect(
        Dictionary.Keys.Uint(ConfigKeyLength),
        storageValue,
        config.get(ConfigStoragePriceIndex)!,
    );
    storageData.set(storageData.values().length - 1, prices);
    config.set(
        ConfigStoragePriceIndex,
        beginCell().storeDictDirect(storageData).endCell(),
    );
    return beginCell().storeDictDirect(config).endCell();
}
