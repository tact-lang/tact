struct Complex {
    a: Int?;
    b: Bool = true;
    c: String?;
    d: Address;
    e: Cell?;
}

contract MixOptionalDefault {
    data: Complex;

    init() {
        self.data = Complex{
            a: null,
            c: null,
            d: myAddress(),
            e: null,
        };
    }
}
