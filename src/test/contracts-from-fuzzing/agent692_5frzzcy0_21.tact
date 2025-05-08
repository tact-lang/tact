struct MultiLevel {
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
    x: Int;
    y: Bool;
}

contract ContractMulti {
    nested: MultiLevel;

    init() {
        self.nested = MultiLevel{
            one: Level1{
                two: Level2{
                    three: Level3{
                        four: Level4{
                            five: Level5{
                                x: 7,
                                y: true
                            }
                        }
                    }
                }
            }
        };
    }
}