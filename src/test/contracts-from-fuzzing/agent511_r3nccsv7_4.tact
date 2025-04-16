struct DeepOptionals {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract OptsInStruct {
    opt: DeepOptionals;

    init() {
        self.opt = DeepOptionals {
            foo: null,
            bar: null,
            baz: true,
        };
    }
}