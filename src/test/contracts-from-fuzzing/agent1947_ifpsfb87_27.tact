struct Level1 {
    a: Int;
}

struct Level2 {
    one: Level1;
}

struct Level3 {
    two: Level2;
}

struct Level4 {
    three: Level3;
}

struct Level5 {
    four: Level4;
}

contract Deep5 {
    lv5: Level5;
    init() {
        self.lv5 = Level5{
            four: Level4{
                three: Level3{
                    two: Level2{
                        one: Level1{
                            a: 42,
                        },
                    },
                },
            },
        };
    }
}