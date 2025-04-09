struct Complex {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: Bool?;
    f: Address?;
}

contract TestContract {
    storage: Complex;

    init() {
        self.storage = Complex{
            a: 123,
            b: true,
            c: myAddress(),
            d: null,
            e: null,
            f: null,
        };
    }
}