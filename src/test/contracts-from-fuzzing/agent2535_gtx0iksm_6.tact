struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MixedOptionals {
    storage: Opts;

    init() {
        self.storage = Opts {
            a: null,
            b: true,
            c: null,
        };
    }
}