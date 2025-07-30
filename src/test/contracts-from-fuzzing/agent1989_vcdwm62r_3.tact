struct Deep {
    lvl3: Int?;
}

struct Mid {
    lvl2: Deep;
}

struct Shallow {
    lvl1: Mid;
}

contract DeepNestContract {
    chain: Shallow;

    init() {
        self.chain = Shallow{
            lvl1: Mid{
                lvl2: Deep{
                    lvl3: 777,
                },
            },
        };
    }
}