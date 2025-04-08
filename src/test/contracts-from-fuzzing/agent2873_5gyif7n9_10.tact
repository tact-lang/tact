struct NullableNested {
    s: String?;
}

struct Container {
    nest: NullableNested?;
    num: Int;
}

contract OptionalNestedStruct {
    val: Container;
    init() {
        self.val = Container{ nest: null, num: 7 };
    }
}