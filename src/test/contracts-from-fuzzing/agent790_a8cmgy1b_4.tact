struct DeepNested1 {
    x: Int;
}

struct DeepNested2 {
    inner: DeepNested1;
}

contract DeepNestedStruct {
    item: DeepNested2;

    init() {
        self.item = DeepNested2{inner: DeepNested1{x: 1}};
    }
}
