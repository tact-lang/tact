struct NestedStruct {
    inner: SimpleStruct; 
    flag: Bool;
}

struct SimpleStruct {
    value: Int;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ inner: SimpleStruct{ value: 123 }, flag: false };
    }
}