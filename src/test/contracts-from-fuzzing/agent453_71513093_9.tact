struct Deeply {
    lvl1: Int;
    lvl2: S2;
}

struct S2 {
    lvl3: Int;
    lvl4: S3;
}

struct S3 {
    lvl5: Int;
    lvl6: S4;
}

struct S4 {
    lvl7: Int;
    flag: Bool;
}

contract TestContract {
    test: Deeply;

    init() {
        self.test = Deeply{
            lvl1: 1,
            lvl2: S2{
                lvl3:3,
                lvl4: S3{
                    lvl5:5,
                    lvl6:S4{
                        lvl7:7,
                        flag:true
                    }
                }
            }
        };
    }
}