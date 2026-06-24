struct Small {
    a: Int;
}

struct Medium {
    sm: Small;
    b: Bool?;
    c: String;
}

struct Complex {
    m1: Medium;
    m2: Medium;
    flag: Bool;
}

contract NestedComplex {
    state: Complex;

    init() {
        self.state = Complex{
            m1: Medium{sm: Small{a: 1}, b: null, c: "x"},
            m2: Medium{sm: Small{a: 2}, b: true, c: "y"},
            flag: false,
        };
    }
}