struct ManyOptions {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract OptionalStorage {
    storage: ManyOptions;

    init() {
        self.storage = ManyOptions{
            a: null,
            b: true,
            c: null,
            d: "hello",
            e: null,
            f: null,
            g: null,
        };
    }
}
