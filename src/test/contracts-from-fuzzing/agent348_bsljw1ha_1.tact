struct NestedStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{foo: 1, bar: true};
    }
}