struct Deep3 {
    lvl3: Int;
}

struct Deep2 {
    lvl2: Deep3;
}

struct Deep1 {
    lvl1: Deep2;
}

contract DeepNested {
    container: Deep1;
    init() {
        self.container = Deep1{
            lvl1: Deep2{
                lvl2: Deep3{
                    lvl3: 33
                }
            }
        };
    }
}