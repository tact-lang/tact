struct DeepOptions {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
}

contract OptFieldsTest {
    opts: DeepOptions;

    init() {
        self.opts = DeepOptions{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}