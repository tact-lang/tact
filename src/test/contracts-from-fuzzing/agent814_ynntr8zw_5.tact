struct Complex {
    opt: Int?;
    s: String;
    b: Bool;
}

contract OptCombo {
    f1: Complex;
    f2: Complex;

    init() {
        self.f1 = Complex{ opt: null, s: "a", b: true };
        self.f2 = Complex{ opt: 42, s: "b", b: false };
    }
}