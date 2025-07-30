struct Level0 {
    a: Level1;
}

struct Level1 {
    b: Level2;
}

struct Level2 {
    c: Level3;
}

struct Level3 {
    d: Level4;
}

struct Level4 {
    val: Int;
}

contract SuperDeep {
    s: Level0;

    init() {
        self.s = Level0{
            a: Level1{
                b: Level2{
                    c: Level3{
                        d: Level4{
                            val: 123
                        }
                    }
                }
            }
        };
    }
}