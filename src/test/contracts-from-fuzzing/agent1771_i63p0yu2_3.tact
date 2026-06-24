struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    a: Int;
    nested: Inner;
    b: String;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            a: 42,
            nested: Inner{
                x: 1,
                y: true,
            },
            b: "hello",
        };
    }
}