struct Deep {
    lvl3: Int;
}

struct Mid {
    lvl2: Deep;
}

struct Top {
    lvl1: Mid;
}

contract DeepNest {
    store: Top;

    init() {
        self.store = Top{
            lvl1: Mid{
                lvl2: Deep{
                    lvl3: 777,
                },
            },
        };
    }
}