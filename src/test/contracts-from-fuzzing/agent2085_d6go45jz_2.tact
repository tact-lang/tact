struct NestedStruct {
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
            inner: InnerStruct{ flag: true, amount: 123 }
        };
    }
}