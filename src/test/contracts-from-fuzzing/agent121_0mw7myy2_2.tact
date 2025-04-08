struct NestedStruct {
    subValue: Int = 42;
}

contract DeepContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{};
    }
}