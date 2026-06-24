struct SOpt {
    nested: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
    flag: Bool;
}

contract OptionalNested {
    data: SOpt;

    init() {
        self.data = SOpt{
            nested: InnerOpt{
                value: null,
                flag: true
            }
        };
    }
}