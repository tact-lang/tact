struct S {
    a: Int;
    b: String;
    c: String?;
    d: Address?;
    e: Bool;
}

contract Test {
    s: S = S{
        a: 10,
        b: "hello",
        c: null,
        d: null,
        e: true
    };
}
