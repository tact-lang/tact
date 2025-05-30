struct DefaultsAndOpts {
    a: Int = 1;
    b: Int?;
    c: String = "hi";
    d: String?;
}

contract MixDefOpt {
    st: DefaultsAndOpts;

    init() {
        self.st = DefaultsAndOpts{
            a: 2,
            b: null,
            c: "yo",
            d: null
        };
    }
}