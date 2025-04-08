struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
}

contract OptionalStructContract {
    s: OptionalStruct;
    init() {
        self.s = OptionalStruct{
            foo: null,
            bar: true,
            baz: null
        };
    }
}