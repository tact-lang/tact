struct ManyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract OptionalFieldsContract {
    data: ManyOptions;

    init() {
        self.data = ManyOptions{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}