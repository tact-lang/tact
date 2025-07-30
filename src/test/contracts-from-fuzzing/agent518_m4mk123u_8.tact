struct Level3 {
    flagC: Bool?;
}

struct Level2 {
    flagB: Bool?;
    lvl3: Level3;
}

struct Level1 {
    flagA: Bool?;
    lvl2: Level2;
}

contract OptionalDeep {
    deepFlags: Level1;

    init() {
        self.deepFlags = Level1{
            flagA: true,
            lvl2: Level2{
                flagB: null,
                lvl3: Level3{
                    flagC: false,
                },
            },
        };
    }
}