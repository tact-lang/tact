struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

struct OuterOpt {
    nested: InnerOpt?;
    name: String?;
}

contract TestContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nested: null,
            name: "fuzz",
        };
    }
}