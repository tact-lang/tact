struct InnerMost {
    data: String?;
}

struct Middle {
    flag: Bool = false;
    node: InnerMost;
}

struct TopLevel {
    count: Int = 1;
    mid: Middle;
}

contract OptionalContained {
    field: TopLevel;

    init() {
        self.field = TopLevel{
            count: 42,
            mid: Middle{
                flag: true,
                node: InnerMost{ data: null }
            }
        };
    }
}