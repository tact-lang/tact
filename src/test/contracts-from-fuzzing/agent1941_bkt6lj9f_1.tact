struct NestedStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    number: Int;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ inner: InnerStruct{ flag: true, number: 42 } };
    }
}