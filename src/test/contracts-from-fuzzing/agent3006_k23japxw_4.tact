struct OptionalsOnOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
}

contract StorageWithOptionals {
    st: OptionalsOnOptionals;

    init() {
        self.st = OptionalsOnOptionals {
            a: null,
            b: true,
            c: null,
            d: 100,
        };
    }
}
