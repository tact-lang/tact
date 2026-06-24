struct Outer {
    a: Int;
    b: Inner?;
}
struct Inner {
    x: Int;
    y: Int?;
}

contract OptionalNestedStruct {
    field: Outer;

    init() {
        self.field = Outer{
            a: 11,
            b: Inner{
                x: 22,
                y: null,
            },
        };
    }
}