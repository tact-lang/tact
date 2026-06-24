struct MidNested {
    n1: Int;
    n2: Bool;
}

struct TopNested {
    mid1: MidNested;
    mid2: MidNested;
    flag: Bool;
}

contract MultiNested {
    data: TopNested;

    init() {
        self.data = TopNested{
            mid1: MidNested{ n1: 1, n2: true },
            mid2: MidNested{ n1: 2, n2: false },
            flag: true
        };
    }
}