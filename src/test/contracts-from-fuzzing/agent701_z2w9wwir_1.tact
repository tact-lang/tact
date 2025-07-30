struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: InnerStruct{
                val: 123
            }
        };
    }
}
