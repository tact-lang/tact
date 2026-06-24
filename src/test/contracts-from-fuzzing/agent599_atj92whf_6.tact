struct Sub {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Sub;
    e: Sub?;
    f: Int?;
    g: Bool?;
}

contract ComplexState {
    state: Complex;
    init() {
        self.state = Complex{
            a: 42,
            b: true,
            c: "Test",
            d: Sub{val1:null, val2:null, val3:null},
            e: null,
            f: null,
            g: false
        };
    }
}