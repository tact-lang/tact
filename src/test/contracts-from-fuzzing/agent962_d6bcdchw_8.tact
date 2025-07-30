struct Inner {
    a: Int;
    b: String;
}

struct Outer {
    x: Inner?;
    y: String;
}

contract NestedOptional {
    field: Outer;

    init() {
        self.field = Outer{
            x: null,
            y: "data"
        };
    }
}