struct ManyOptions {
    a: String?;
    b: Cell?;
    c: Address?;
    d: Int?;
    e: Bool?;
}

contract Test {
    data: ManyOptions;

    init() {
        self.data = ManyOptions{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}
