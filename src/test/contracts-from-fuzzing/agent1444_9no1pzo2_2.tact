struct InnerStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{ foo: 10, bar: true };
    }
}
