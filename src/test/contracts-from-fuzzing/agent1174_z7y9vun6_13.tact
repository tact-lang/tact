struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Address?;
    e: Cell?;
    f: Slice?
}

contract ComplexFields {
    x: Complex = Complex{
        a: 42,
        b: true,
        c: "hi",
        d: null,
        e: null,
        f: null
    };
}