struct ManyOptions {
    a: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
}

contract OptionalFields {
    data: ManyOptions;

    init() {
        self.data = ManyOptions{
            a: null,
            b: null,
            s: null,
            c: null,
            sl: null,
        };
    }
}