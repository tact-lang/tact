struct SomeStruct {
    a: Int as uint8;
    b: Int as int64;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String;
    g: Cell;
    h: Slice;
    i: Address;
}

contract TestContract(
    s: SomeStruct
) {}
