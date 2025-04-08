struct TinyOpt {
    foo: Int?;
    bar: Int?;
}

contract OptionalFields {
    s: TinyOpt;

    init() {
        self.s = TinyOpt{ foo: null, bar: 5 };
    }
}