struct NestedStruct {
    val1: Int;
    val2: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    count: Int;
}

contract TestContract {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            val1: 1,
            val2: true,
            inner: InnerStruct{
                flag: false,
                count: 42,
            }
        };
    }
}
