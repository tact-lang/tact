struct DeepInner {
    f1: Int;
    f2: Bool?;
    f3: String;
}

struct Middle {
    d1: DeepInner;
    d2: DeepInner;
}

struct Complex {
    m1: Middle;
    m2: Middle;
    x: Int;
}

contract TestContract {
    complexField: Complex;

    init() {
        self.complexField = Complex{
            m1: Middle{
                d1: DeepInner{ f1: 10, f2: null, f3: "x" },
                d2: DeepInner{ f1: 20, f2: true, f3: "y" },
            },
            m2: Middle{
                d1: DeepInner{ f1: 30, f2: false, f3: "z" },
                d2: DeepInner{ f1: 40, f2: null, f3: "w" },
            },
            x: 777,
        };
    }
}