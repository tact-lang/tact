struct Deep {
    a: Int = 1;
}

struct MidLevel {
    deep: Deep;
}

struct TopLevel {
    mid: MidLevel;
}

contract TestDeepNested {
    store: TopLevel;

    init() {
        self.store = TopLevel{
            mid: MidLevel{
                deep: Deep{},
            },
        };
    }

    receive() {}
}