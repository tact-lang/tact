struct NestedEmptyOptionals {
    field1: Int?;
    field2: Int?;
}

struct WrapEmpty {
    nested: NestedEmptyOptionals?;
}

contract EmptyOptionalsStruct {
    data: WrapEmpty;
    init() {
        self.data = WrapEmpty{ nested: null };
    }
}