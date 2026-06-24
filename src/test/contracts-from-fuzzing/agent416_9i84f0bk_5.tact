struct ManyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract OptFields {
    stuff: ManyOptions;

    init() {
        self.stuff = ManyOptions{
            a: null, b: null, c: null, d: null, e: null
        };
    }
}