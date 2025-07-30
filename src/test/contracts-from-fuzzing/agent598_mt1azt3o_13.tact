struct Inner {
    num: Int?;
    flag: Bool?;
}

struct OuterOpt {
    nested: Inner?;
    name: String?;
    count: Int?;
}

contract PartialOptInit {
    state: OuterOpt?;

    init() {
        self.state = OuterOpt{
            nested: Inner{ num: null, flag: null },
            name: null,
            count: null
        };
    }
}