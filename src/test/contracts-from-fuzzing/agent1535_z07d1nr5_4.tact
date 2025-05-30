struct InnerOpt {
    x: Int?;
    flag: Bool?;
}

struct OuterOpt {
    name: String?;
    nested: InnerOpt?;
}

contract OptionalNestStorage {
    data: OuterOpt = OuterOpt {
        name: null,
        nested: null,
    };
    init() {
        self.data = OuterOpt{
            name: "hi",
            nested: InnerOpt{ x: 123, flag: true },
        };
    }
}
