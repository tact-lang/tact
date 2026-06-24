struct ExcessiveNested {
    one: Level1;
}

struct Level1 {
    two: Level2;
}

struct Level2 {
    three: Level3;
}

struct Level3 {
    four: Level4;
}

struct Level4 {
    five: Level5;
}

struct Level5 {
    six: Level6;
}

struct Level6 {
    val: Int;
}

contract Deepest {
    s: ExcessiveNested;

    init() {
        self.s = ExcessiveNested{
            one: Level1{
                two: Level2{
                    three: Level3{
                        four: Level4{
                            five: Level5{
                                six: Level6{
                                    val: 42,
                                },
                            },
                        },
                    },
                },
            },
        };
    }
}