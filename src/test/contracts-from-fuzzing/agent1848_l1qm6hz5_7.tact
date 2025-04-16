struct ManyOptions {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract OptStructTest {
    s: ManyOptions;

    init() {
        self.s = ManyOptions{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}