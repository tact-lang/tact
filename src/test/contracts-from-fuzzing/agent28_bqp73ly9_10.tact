struct OptStruct {
    foo: Int?;
    bar: Bool?;
    text: String?;
}

contract OptionalStructDefaults {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            foo: null,
            bar: null,
            text: null,
        };
    }
}