struct SubNested {
    f1: Int;
    f2: Bool;
}

struct TopNested {
    sub1: SubNested;
    sub2: SubNested;
}

contract TwoLevelReuse {
    data: TopNested;

    init() {
        self.data = TopNested{
            sub1: SubNested{ f1: 1, f2: true },
            sub2: SubNested{ f1: 2, f2: false },
        };
    }
}