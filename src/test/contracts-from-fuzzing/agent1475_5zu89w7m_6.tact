struct Complex {
    i: Int;
    b: Bool;
    s: String;
    optInt: Int?;
    optString: String?;
}

contract ComplexArray {
    d0: Complex;
    d1: Complex;
    d2: Complex;
    d3: Complex;

    init() {
        self.d0 = Complex{ i: 0, b: true, s: "z", optInt: null, optString: null };
        self.d1 = Complex{ i: 1, b: false, s: "o", optInt: 11, optString: null };
        self.d2 = Complex{ i: 2, b: true, s: "t", optInt: null, optString: "x" };
        self.d3 = Complex{ i: 3, b: false, s: "f", optInt: 41, optString: "seven" };
    }
}