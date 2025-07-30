struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ComplexStorage {
    persist: Complex;

    init() {
        self.persist = Complex{
            a: 1, b: true, c: "hi",
            d: null, e: null, f: null
        };
    }
}