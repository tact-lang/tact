struct Combo {
    x: Int;
    s: String;
    f: Bool;
    addr: Address?;
    cl: Cell?;
}

contract FieldOrder {
    c: Combo = Combo{
        x: 1,
        s: "z",
        f: true,
        addr: null,
        cl: null,
    };
}