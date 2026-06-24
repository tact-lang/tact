struct InnerOpt {
    x: Int?;
    s: String?;
}

struct OptionalNested {
    sub: Int?;
    flag: Bool?;
    addr: Address?;
    inner: InnerOpt;
}

contract OptNest {
    store: OptionalNested;
    init() {
        self.store = OptionalNested{
            sub: null,
            flag: true,
            addr: null,
            inner: InnerOpt{
                x: null,
                s: null
            }
        };
    }
}