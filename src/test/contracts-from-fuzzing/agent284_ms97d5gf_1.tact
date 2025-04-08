struct NestedStruct {
    fieldA: Int = 1;
    fieldB: Bool = true;
}

contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{};
    }
}