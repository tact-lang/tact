struct DeepA {
    a: Int;
    b: Bool;
}

struct DeepB {
    c: Int;
    d: DeepA;
}

struct DeepC {
    e: Bool;
    f: Int?;
    g: DeepB;
}

contract TestEdge {
    data: DeepC;

    init() {
        self.data = DeepC{
            e: true,
            f: null,
            g: DeepB{
                c: 42,
                d: DeepA{ a: -1, b: false },
            }
        };
    }

    receive() {
        self.data = DeepC{
            e: false,
            f: 100,
            g: DeepB{
                c: 0,
                d: DeepA{ a: 1, b: true },
            }
        };
    }
}