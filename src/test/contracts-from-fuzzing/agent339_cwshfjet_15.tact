struct BigNested {
    lvl1: Int;
    nxt: BigNested2;
}

struct BigNested2 {
    lvl2: Int;
    nxt: BigNested3;
}

struct BigNested3 {
    lvl3: Int;
    nxt: BigNested4;
}

struct BigNested4 {
    lvl4: Int;
}

contract NestedLarge {
    data: BigNested;

    init() {
        self.data = BigNested{
            lvl1:1,
            nxt: BigNested2{
                lvl2:2,
                nxt: BigNested3{
                    lvl3:3,
                    nxt: BigNested4{
                        lvl4:4
                    }
                }
            }
        };
    }
}