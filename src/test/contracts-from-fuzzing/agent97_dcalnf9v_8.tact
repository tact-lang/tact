struct Complex {
    a: Int = 0;
    b: Int?;
    c: Bool = false;
    d: String = "hello";
    e: Address;
}

contract ComplexFields {
    foo: Complex;
    init() {
        self.foo = Complex{
            e: myAddress(),
            b: null
        };
    }
}