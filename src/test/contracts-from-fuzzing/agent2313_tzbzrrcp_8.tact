struct NestedStructDefaults {
    field1: Int = 1;
    field2: Bool = false;
    field3: String = "hello";
    nested: InnerNested;
}

struct InnerNested {
    in1: Int = 42;
    in2: Bool = true;
}

contract TestContract {
    x: NestedStructDefaults;

    init() {
        self.x = NestedStructDefaults{
            nested: InnerNested{}
        };
    }
}