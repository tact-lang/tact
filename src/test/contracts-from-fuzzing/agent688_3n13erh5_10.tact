struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell;
    e: Address?;
    f: Bool;
    g: Int?;
}

contract TestContract {
    foo: Complex;

    init() {
        self.foo = Complex{
            a: 42,
            b: null,
            c: "abc",
            d: emptyCell(),
            e: null,
            f: true,
            g: null,
        };
    }
}