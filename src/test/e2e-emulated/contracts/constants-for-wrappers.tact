const INT: Int = 10;
const STRING: String = "hello world";
const STRING_WITH_QUOTES: String = "hello \"world\"";
const BOOL: Bool = true;
const ADDR: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
const CELL: Cell = cell("te6ccgEBCAEApAABFP8A9KQT9LzyyAsBAgFiAgMAptAB0HLXIdIA0gD6QCEQNFBmbwT4YQL4Yu1E0NIAAZT6QAExkzD4KOICkVvgcCHXSSDCH5UxAdMfMJEy4sAAAcEhsJvIfwHKAAHPFsntVOAw8sCCAgFIBAUBK7i9TtRNDSAAGU+kABMZMw+Cji2zwxgGASu4Ud7UTQ0gABlPpAATGTMPgo4ts8MYBwACegACIA==");
const SLICE: Slice = slice("te6ccgEBCAEApAABFP8A9KQT9LzyyAsBAgFiAgMAptAB0HLXIdIA0gD6QCEQNFBmbwT4YQL4Yu1E0NIAAZT6QAExkzD4KOICkVvgcCHXSSDCH5UxAdMfMJEy4sAAAcEhsJvIfwHKAAHPFsntVOAw8sCCAgFIBAUBK7i9TtRNDSAAGU+kABMZMw+Cji2zwxgGASu4Ud7UTQ0gABlPpAATGTMPgo4ts8MYBwACegACIA==");

struct SimpleStruct {
    value: Int;
}

const SIMPLE_STRUCT: SimpleStruct = SimpleStruct{ value: 10 };

struct NestedStruct {
    value: Int;
    other: SimpleStruct;
}

const NESTED_STRUCT: NestedStruct = NestedStruct{ value: 10, other: SimpleStruct{ value: 11 } };

contract ConstantTester {
    const INT: Int = 10;
    const STRING: String = "hello world";
    const STRING_WITH_QUOTES: String = "hello \"world\"";
    const BOOL: Bool = true;
    const ADDR: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
    const CELL: Cell = cell("te6ccgEBCAEApAABFP8A9KQT9LzyyAsBAgFiAgMAptAB0HLXIdIA0gD6QCEQNFBmbwT4YQL4Yu1E0NIAAZT6QAExkzD4KOICkVvgcCHXSSDCH5UxAdMfMJEy4sAAAcEhsJvIfwHKAAHPFsntVOAw8sCCAgFIBAUBK7i9TtRNDSAAGU+kABMZMw+Cji2zwxgGASu4Ud7UTQ0gABlPpAATGTMPgo4ts8MYBwACegACIA==");
    const SLICE: Slice = slice("te6ccgEBCAEApAABFP8A9KQT9LzyyAsBAgFiAgMAptAB0HLXIdIA0gD6QCEQNFBmbwT4YQL4Yu1E0NIAAZT6QAExkzD4KOICkVvgcCHXSSDCH5UxAdMfMJEy4sAAAcEhsJvIfwHKAAHPFsntVOAw8sCCAgFIBAUBK7i9TtRNDSAAGU+kABMZMw+Cji2zwxgGASu4Ud7UTQ0gABlPpAATGTMPgo4ts8MYBwACegACIA==");

    const SIMPLE_STRUCT: SimpleStruct = SimpleStruct{ value: 10 };

    const NESTED_STRUCT: NestedStruct = NestedStruct{ value: 10, other: SimpleStruct{ value: 11 } };

    receive() {}

    get fun globalInt(): Int { return INT; }
    get fun globalString(): String { return STRING; }
    get fun globalStringWithQuotes(): String { return STRING_WITH_QUOTES; }
    get fun globalBool(): Bool { return BOOL; }
    get fun globalAddress(): Address { return ADDR; }
    get fun globalCell(): Cell { return CELL; }
    get fun globalSlice(): Slice { return SLICE; }
    get fun globalSimpleStruct(): SimpleStruct { return SIMPLE_STRUCT; }
    get fun globalNestedStruct(): NestedStruct { return NESTED_STRUCT; }

    get fun contractInt(): Int { return self.INT; }
    get fun contractString(): String { return self.STRING; }
    get fun contractStringWithQuotes(): String { return self.STRING_WITH_QUOTES; }
    get fun contractBool(): Bool { return self.BOOL; }
    get fun contractAddress(): Address { return self.ADDR; }
    get fun contractCell(): Cell { return self.CELL; }
    get fun contractSlice(): Slice { return self.SLICE; }
    get fun contractSimpleStruct(): SimpleStruct { return self.SIMPLE_STRUCT; }
    get fun contractNestedStruct(): NestedStruct { return self.NESTED_STRUCT; }
}
