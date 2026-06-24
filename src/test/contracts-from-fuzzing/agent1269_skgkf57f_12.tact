struct ParamDefault {
    foo: Int = 5;
    bar: Int?;
    baz: Bool = false;
    qux: String = "default";
}

contract DefaultsContr {
    data: ParamDefault;
    init() {
        self.data = ParamDefault{
            foo: 42,
            bar: null,
            baz: true,
            qux: "non-default",
        };
    }
}
