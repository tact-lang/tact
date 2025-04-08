struct Level3 {
    a: String?;
    b: Bool;
}

struct Level2 {
    lvl3: Level3;
    c: Int;
}

struct Level1 {
    lvl2: Level2;
    d: Bool?;
}

contract OptionalsDeepMix {
    state: Level1;

    init() {
        self.state = Level1{
            lvl2: Level2{
                lvl3: Level3{
                    a: null,
                    b: true,
                },
                c: 5,
            },
            d: false,
        };
    }
}