struct One {
    a: Int;
    b: Bool;
    c: String;
}

struct Two {
    nested: One;
    x: Int;
}

struct Three {
    nested: Two;
    y: Bool;
}

contract DeepChain {
    data: Three;

    init() {
        self.data = Three{
            nested: Two{
                nested: One{
                    a: 42,
                    b: true,
                    c: "hi",
                },
                x: 17,
            },
            y: false,
        };
    }
}
