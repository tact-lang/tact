struct Inner {
    x: Int;
    y: Bool?;
    z: String;
}

struct Middle {
    a: Int;
    b: Inner;
    c: String?;
}

contract DeepNested {
    data: Middle;
    init() {
        self.data = Middle {
            a: 42,
            b: Inner {
                x: -7,
                y: true,
                z: "deep"
            },
            c: null
        };
    }
}