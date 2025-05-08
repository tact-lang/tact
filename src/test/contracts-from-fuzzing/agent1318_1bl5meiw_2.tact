struct DeepNestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract DeepNestedContract {
    data: DeepNestedStruct;

    init() {
        self.data = DeepNestedStruct{ inner: InnerStruct{ val: 1, flag: true } };
    }
}