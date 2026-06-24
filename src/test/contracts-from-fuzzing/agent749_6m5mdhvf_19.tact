struct Deep1 {
    lvl2: Deep2;
}

struct Deep2 {
    lvl3: Deep3;
}

struct Deep3 {
    lvl4: Deep4;
}

struct Deep4 {
    lvl5: Int;
}

contract Depth5 {
    root: Deep1;

    init() {
        self.root = Deep1{
            lvl2: Deep2{
                lvl3: Deep3{
                    lvl4: Deep4{
                        lvl5: 5
                    }
                }
            }
        };
    }
}