struct HasOptals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract FuzzOptFields {
    persisted: HasOptals;

    init() {
        self.persisted = HasOptals {
            a: 1,
            b: false,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: sender()
        };
    }
}
