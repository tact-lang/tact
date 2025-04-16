struct InnerOpt {
    value: Int?;
}

struct OuterOpt {
    nested: InnerOpt?;
    anotherNested: InnerOpt?;
}

contract TestContract {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            nested: null,
            anotherNested: null,
        };
    }
}