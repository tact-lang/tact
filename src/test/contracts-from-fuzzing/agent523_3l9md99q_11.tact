struct OptionalDeepNested {
    foo: OptionalInnerA?;
}

struct OptionalInnerA {
    bar: OptionalInnerB?;
}

struct OptionalInnerB {
    baz: Int?;
}

contract OptionalDeepNestedContract {
    s: OptionalDeepNested;
    init() {
        self.s = OptionalDeepNested{
            foo: OptionalInnerA{
                bar: OptionalInnerB{ baz: null }
            }
        };
    }
}