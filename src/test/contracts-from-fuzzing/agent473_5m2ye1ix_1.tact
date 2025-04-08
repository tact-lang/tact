struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract TestContract {
    myField: NestedStruct;

    init() {
        self.myField = NestedStruct{inner: InnerStruct{value: 42}};
    }
}