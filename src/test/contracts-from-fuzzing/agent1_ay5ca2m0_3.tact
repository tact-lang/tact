struct OptionalsDeep {
    a: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    addr: Address?;
    nested: Inner?;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract OptDeepTest {
    st: OptionalsDeep;

    init() {
        self.st = OptionalsDeep{
            a: null,
            b: null,
            s: null,
            c: null,
            addr: null,
            nested: null
        };
    }
}
