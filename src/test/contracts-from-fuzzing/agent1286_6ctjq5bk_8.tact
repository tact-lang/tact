struct Complex {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ComplexDefaults {
    state: Complex;

    init() {
        self.state = Complex{
            d: null,
            e: true,
            f: "test"
        };
    }
}