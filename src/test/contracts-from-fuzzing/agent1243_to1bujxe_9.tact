struct ManyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract Test {
    f: ManyOptions;
    init() {
        self.f = ManyOptions{ a: null, b: null, c: null, d: null };
    }
}