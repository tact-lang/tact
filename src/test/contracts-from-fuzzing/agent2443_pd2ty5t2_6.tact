struct Complex {
    a: Int;
    b: Bool;
    c: Bool?;
    d: String;
    e: String?;
    f: Address;
    g: Address?;
}

contract TestContract {
    value: Complex;
    init() {
        self.value = Complex{
            a: 1,
            b: true,
            c: null,
            d: "hi",
            e: null,
            f: myAddress(),
            g: null
        };
    }
}