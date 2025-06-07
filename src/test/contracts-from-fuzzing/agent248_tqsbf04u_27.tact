struct AllOpts {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract FullyOptional {
    store: AllOpts;

    init() {
        self.store = AllOpts{
            a: null,
            b: "set",
            c: null
        };
    }
}