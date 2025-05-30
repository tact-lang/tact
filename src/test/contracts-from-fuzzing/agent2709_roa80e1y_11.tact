struct Level1 {
    a: Int;
}
struct Level2 {
    b: Level1;
}
struct Level3 {
    c: Level2;
}
struct Level4 {
    d: Level3;
}
struct Level5 {
    e: Level4;
}
struct Level6 {
    f: Level5;
}

contract SixDeep {
    data: Level6;
    init() {
        self.data = Level6{
            f: Level5{
                e: Level4{
                    d: Level3{
                        c: Level2{
                            b: Level1{
                                a: 15
                            }
                        }
                    }
                }
            }
        };
    }
}