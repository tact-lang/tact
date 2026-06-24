struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptionalDefaults {
    entry: SOpt;

    init() {
        self.entry = SOpt{
            a: null,
            b: true,
            c: null,
        };
    }
}