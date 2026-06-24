struct Inner {
    value: Int = 100;
    label: String = "inner";
}

struct Outer {
    id: Int;
    nested: Inner;
}

contract NestedDefaults {
    data: Outer;

    init() {
        self.data = Outer{
            id: 1,
            nested: Inner{},
        };
    }
}