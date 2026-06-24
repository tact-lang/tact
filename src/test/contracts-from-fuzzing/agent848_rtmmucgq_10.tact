struct WithDefaultStruct {
    foo: Int = 42;
    bar: Bool = false;
    baz: String = "hello";
}

contract StructDefaultValues {
    data: WithDefaultStruct;

    init() {
        self.data = WithDefaultStruct{};
    }
}