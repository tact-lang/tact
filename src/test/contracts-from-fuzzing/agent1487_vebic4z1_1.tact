struct NestedStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            a: 123,
            b: true
        };
    }
}