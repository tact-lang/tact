struct One {
    a: Int;
}

struct Two {
    b: Bool;
    one: One;
}

struct Three {
    c: String;
    two: Two;
}

contract DeepChain {
    d: Three;

    init() {
        self.d = Three{
            c: "level 3",
            two: Two{
                b: true,
                one: One{ a: 123 }
            }
        };
    }
}
