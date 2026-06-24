struct Complex {
    a: Int = 7;
    b: Bool?;
    c: String = "hello";
    d: Int?;
}

contract ComplexState {
    data: Complex;

    init() {
        self.data = Complex{a: 10, b: null, c: "world", d: 1};
    }
}