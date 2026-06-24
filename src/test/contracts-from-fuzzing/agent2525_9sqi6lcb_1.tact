struct NestedStruct {
    inner: SimpleStruct;
    flag: Bool;
}

struct SimpleStruct {
    value: Int;
}

contract TestContract {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{
            inner: SimpleStruct{value: 42},
            flag: true
        };
    }
}