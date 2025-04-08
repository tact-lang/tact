struct InnerMost {
    value: Int;
    flag: Bool?;
}

struct InnerLevel {
    inner: InnerMost;
    name: String?;
}

struct MidLevel {
    optInner: InnerLevel?;
    amount: Int;
}

struct TopLevel {
    mid: MidLevel;
    note: String?;
}

contract TestContract {
    config: TopLevel;

    init() {
        self.config = TopLevel {
            mid: MidLevel { optInner: null, amount: 777 },
            note: null
        };
    }
}