struct Complex {
    a: Int?;
    b: NestedA?;
    c: NestedB?;
    d: Bool?;
}

struct NestedA {
    flag: Bool?;
}

struct NestedB {
    text: String?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            a: null,
            b: NestedA{ flag: null },
            c: NestedB{ text: null },
            d: null,
        };
    }
}