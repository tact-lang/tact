struct Level3 {
    deepVal: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract VeryDeep {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{
                    deepVal: 999,
                },
            },
        };
    }
}