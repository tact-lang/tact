struct Complex {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

contract Combo {
    x: Complex;
    y: Complex;
    z: Complex;
    init() {
        self.x = Complex{a: 1, b: true, c: null, d: false};
        self.y = Complex{a: 2, b: false, c: 3, d: null};
        self.z = Complex{a: 4, b: true, c: null, d: null};
    }
}