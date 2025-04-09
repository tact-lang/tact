struct MultiOptional {
    foo: Int?;
    bar: Bool?;
    txt: String?;
}

contract OptFields {
    f: MultiOptional;

    init() {
        self.f = MultiOptional{
            foo: null,
            bar: null,
            txt: null
        };
    }
}
