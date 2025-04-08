struct NestedStruct {
    val1: Int;
    val2: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    amount: Int;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            val1: 5,
            val2: true,
            inner: InnerStruct{
                flag: false,
                amount: 42
            }
        };
    }
}
