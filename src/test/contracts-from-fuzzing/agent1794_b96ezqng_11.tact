struct InnerOptionals {
    x: Int?;
    y: Bool?;
    s: String?;
}

struct Outer {
    inner: InnerOptionals?;
    a: Int;
}

contract NestedOptionalFields {
    st: Outer;

    init() {
        self.st = Outer {
            inner: InnerOptionals {
                x: 1,
                y: false,
                s: "hi"
            },
            a: 10
        };
    }
}
