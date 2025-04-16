struct InnerStruct {
    val: Int;
}

struct OuterStruct {
    nested: InnerStruct;
}

contract NestedStructContract {
    storage: OuterStruct;

    init() {
        self.storage = OuterStruct{ nested: InnerStruct{ val: 42 } };
    }
}