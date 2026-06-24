// test contract with nested structs, with optionals inside
struct InnerMost {
    flag: Bool?;
}
struct MiddleLevel {
    inner: InnerMost?;
    count: Int;
}
struct Outer {
    middle: MiddleLevel;
    label: String;
}

contract MultiNestedWithOptionals {
    field: Outer;
    init() {
        self.field = Outer{
            middle: MiddleLevel{
                inner: null,
                count: 42
            },
            label: "deep"
        };
    }
}