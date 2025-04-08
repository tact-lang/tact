struct BigNestLvl4 {
    a: Int;
    b: Bool;
}

struct BigNestLvl3 {
    x1: BigNestLvl4;
    x2: BigNestLvl4;
    x3: BigNestLvl4;
}

struct BigNestLvl2 {
    y1: BigNestLvl3;
    y2: BigNestLvl3;
}

struct BigNestLvl1 {
    z: BigNestLvl2;
}

contract WiderDeeper {
    data: BigNestLvl1;

    init() {
        self.data = BigNestLvl1{
            z: BigNestLvl2{
                y1: BigNestLvl3{
                    x1: BigNestLvl4{ a:1, b:true },
                    x2: BigNestLvl4{ a:2, b:false },
                    x3: BigNestLvl4{ a:3, b:true },
                },
                y2: BigNestLvl3{
                    x1: BigNestLvl4{ a:4, b:true },
                    x2: BigNestLvl4{ a:5, b:false },
                    x3: BigNestLvl4{ a:6, b:true },
                }
            }
        };
    }
}
