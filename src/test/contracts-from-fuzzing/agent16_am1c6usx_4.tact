struct DeepOpt {
    a: Int?;
    b: String?;
    c: Cell?;
    d: Address?;
}

contract OptsTest {
    st: DeepOpt;

    init() {
        self.st = DeepOpt{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}
