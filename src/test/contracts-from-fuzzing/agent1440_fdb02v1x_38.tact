struct StringsOpts {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract StringsOptions {
    data: StringsOpts;

    init() {
        self.data = StringsOpts{
            a: "a",
            b: null,
            c: "c",
            d: null
        };
    }
}