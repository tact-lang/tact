struct ManyFields {
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
    m: Int;
    n: Bool;
    o: Address;
    p: Cell;
    q: Slice;
    r: String;
    s: Int?;
    t: Bool?;
}

contract Huge(
    mf: ManyFields
) {}