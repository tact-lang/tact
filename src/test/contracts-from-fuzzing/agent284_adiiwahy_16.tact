struct Inner {
    flag: Bool;
}

struct Outer {
    nested: Inner?;
}

contract NullableNested {
    value: Outer;

    init() {
        self.value = Outer{
            nested: null
        };
    }
}