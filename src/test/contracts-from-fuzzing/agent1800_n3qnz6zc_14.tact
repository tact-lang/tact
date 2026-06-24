struct OptionalInStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptStructInContract {
    s: OptionalInStruct;

    init() {
        self.s = OptionalInStruct{
            foo: null,
            bar: true,
            baz: null
        };
    }
}