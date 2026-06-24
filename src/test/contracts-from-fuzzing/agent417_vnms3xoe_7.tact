struct InnerOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
}

struct OuterOpt {
    nested: InnerOpt?;
    d: Int;
    e: Bool;
}

contract TestOpt {
    state: OuterOpt;

    init() {
        self.state = OuterOpt{
            nested: null,
            d: 5,
            e: true,
        };
    }
}