struct Mix {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
    m: Int as uint64;
    n: Int as int64;
}

contract MixStore(
    mix: Mix
) {}