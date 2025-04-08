struct OptStruct {
    foo: Int?;
    bar: Bool?;
}

contract PartialOpc {
    st: OptStruct;

    init() {
        self.st = OptStruct{
            foo: 42
            // bar omitted, should default to null
        };
    }
}