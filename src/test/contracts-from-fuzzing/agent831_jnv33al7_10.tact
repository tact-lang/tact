struct NestedStr {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
}

contract NestedFieldContract {
    storage: NestedStr;
    init() {
        self.storage = NestedStr{
            inner: InnerStruct{ val: 123 }
        };
    }
}