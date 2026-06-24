struct InnerStr {
    one: Int;
}

struct OuterStr {
    first: InnerStr;
    second: InnerStr;
    third: InnerStr;
}

struct HighestStr {
    data: OuterStr;
}

contract ChainNested {
    store: HighestStr;

    init() {
        self.store = HighestStr{
            data: OuterStr{
                first: InnerStr{ one: 1 },
                second: InnerStr{ one: 2 },
                third: InnerStr{ one: 3 },
            },
        };
    }
}