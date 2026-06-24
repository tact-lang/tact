struct Complex {
    a: Int as uint32;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool = false;
    f: String = "hi";
}

contract TestContract {
    store: Complex;

    init() {
        self.store = Complex{
            a: 100,
            b: null,
            c: null,
            d: 42,
            e: true,
            f: "hello"
        };
    }
}
