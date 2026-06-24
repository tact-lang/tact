struct MultiOpts {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Cell?;
    f5: Address?;
}

contract OptionalFields {
    s: MultiOpts;
    init() {
        self.s = MultiOpts{
            f1: null,
            f2: true,
            f3: null,
            f4: null,
            f5: null
        };
    }
}