struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    nested: Inner?;
    s: String;
}

contract OptionalNested {
    field: Outer;
    init() {
        self.field = Outer{
            nested: null,
            s: "hello",
        };
    }
}