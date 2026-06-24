struct OptStruct {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStruct {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}
