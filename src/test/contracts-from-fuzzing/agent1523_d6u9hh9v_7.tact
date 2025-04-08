struct DeepA {
    a: Int;
    b: Bool;
}

struct DeepB {
    x: DeepA;
    y: DeepA;
}

struct DeepC {
    u: DeepB;
    v: DeepB;
}

contract TestContract {
    nested: DeepC;

    init() {
        self.nested = DeepC{
            u: DeepB{
                x: DeepA{a: 1, b: true},
                y: DeepA{a: 2, b: false},
            },
            v: DeepB{
                x: DeepA{a: 3, b: true},
                y: DeepA{a: 4, b: false},
            },
        };
    }
}