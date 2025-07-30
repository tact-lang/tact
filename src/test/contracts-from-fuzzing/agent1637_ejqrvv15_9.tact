struct NestedWithDefault {
    foo: Int = 5;
    bar: InnerNested;
}

struct InnerNested {
    a: Int = 7;
    b: Bool;
}

contract NestedDefaultTest {
    value: NestedWithDefault;

    init() {
        self.value = NestedWithDefault{
            bar: InnerNested{
                b: true
            }
        };
    }
}