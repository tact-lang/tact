// Testing contract params with serialization annotations
contract SerializeParams(
    a: Int as uint32,
    b: Int as int64,
    c: Int,
    d: Bool,
    e: Bool?,
    f: Address,
    g: String,
    h: Cell,
    i: Slice,
) {}
