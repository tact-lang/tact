struct Complex {
    a: Int;
    b: String;
    c: Address;
    d: Bool?;
    e: String?;
}

contract ComplexStorage {
    persistent: Complex;

    init() {
        self.persistent = Complex{
            a: 55,
            b: "hello",
            c: myAddress(),
            d: null,
            e: "optional"
        };
    }
}