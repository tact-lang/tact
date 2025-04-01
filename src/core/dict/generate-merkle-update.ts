import { beginCell } from "@/core/boc/builder";
import type { Cell } from "@/core/boc/cell";
import type {
    DictionaryKeyTypes,
    Dictionary,
    DictionaryKey,
} from "@/core/dict/dictionary";
import { generateMerkleProof } from "@/core/dict/generate-merkle-proof";

function convertToMerkleUpdate(c1: Cell, c2: Cell): Cell {
    return beginCell()
        .storeUint(4, 8)
        .storeBuffer(c1.hash(0))
        .storeBuffer(c2.hash(0))
        .storeUint(c1.depth(0), 16)
        .storeUint(c2.depth(0), 16)
        .storeRef(c1)
        .storeRef(c2)
        .endCell({ exotic: true });
}

export function generateMerkleUpdate<K extends DictionaryKeyTypes, V>(
    dict: Dictionary<K, V>,
    key: K,
    keyObject: DictionaryKey<K>,
    newValue: V,
): Cell {
    const oldProof = generateMerkleProof(dict, [key], keyObject).refs[0];
    dict.set(key, newValue);
    const newProof = generateMerkleProof(dict, [key], keyObject).refs[0];
    if (typeof oldProof === 'undefined' || typeof newProof === 'undefined') {
        throw new Error("Bug");
    }
    return convertToMerkleUpdate(oldProof, newProof);
}
