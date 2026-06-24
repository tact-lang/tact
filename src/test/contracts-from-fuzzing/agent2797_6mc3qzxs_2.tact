struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalStructContract {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{
            foo: 10,
            bar: null,
            baz: "test"
        };
    }
}