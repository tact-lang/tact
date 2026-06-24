struct StructVal {
    foo: Int;
}

struct OptionalNestedOptStruct {
    nested: StructVal?;
}

contract OptNestedStructTest {
    val: OptionalNestedOptStruct;

    init() {
        self.val = OptionalNestedOptStruct {
            nested: null
        };
    }
}