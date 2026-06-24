struct DeepNest {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
}

contract DeepNestedField {
    data: DeepNest;

    init() {
        self.data = DeepNest{inner: InnerStruct{val: 9}};
    }
}