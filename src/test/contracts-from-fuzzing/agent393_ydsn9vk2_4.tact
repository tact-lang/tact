struct MultiNested {
    a: Int;
    b: OptionalNest;
    c: Inner;
}

contract DeepNest {
    value: MultiNested = MultiNested{
        a: 1,
        b: OptionalNest{
            x: null,
            y: null,
            s: null,
        },
        c: Inner{
            x: 2,
            y: true,
            s: "hello",
        },
    };
    init() {
        self.value = MultiNested{
            a: 10,
            b: OptionalNest{
                x: 42,
                y: false,
                s: "bye",
            },
            c: Inner{
                x: 20,
                y: false,
                s: "world",
            },
        };
    }
}

struct Inner {
    x: Int;
    y: Bool;
    s: String;
}

struct OptionalNest {
    x: Int?;
    y: Bool?;
    s: String?;
}
