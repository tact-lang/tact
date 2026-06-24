struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract TestContract {
    data: OptionalStruct;
    init() {
        self.data = OptionalStruct{};
    }
    receive() {}
}