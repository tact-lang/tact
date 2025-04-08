struct OptionalOnly {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract OnlyOptionals {
    st: OptionalOnly;

    init() {
        self.st = OptionalOnly{
            f1: null,
            f2: null,
            f3: null
        };
    }
}