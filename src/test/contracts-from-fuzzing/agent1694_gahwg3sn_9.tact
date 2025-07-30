struct ManyOption {
    s: String?;
    n: Int?;
    f: Bool?;
    c: Cell?;
    sl: Slice?;
    a: Address?;
}

contract OptionStructTest {
    data: ManyOption;

    init() {
        self.data = ManyOption{
            s: null,
            n: null,
            f: null,
            c: null,
            sl: null,
            a: null
        };
    }
}