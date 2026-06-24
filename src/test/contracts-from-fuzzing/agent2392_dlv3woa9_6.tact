struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: Int;
    d: S1;
    e: String;
    f: Bool;
}

contract StructMix {
    s: S2 = S2{ c: 99, d: S1{ a: 1, b: true }, e: "ok", f: false };
}