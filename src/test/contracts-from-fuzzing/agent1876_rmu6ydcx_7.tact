struct Deep1 {
    lvl2: Deep2;
}

struct Deep2 {
    lvl3: Deep3;
}

struct Deep3 {
    var1: Int;
    var2: Bool;
}

contract MultiLevel {
    data: Deep1;

    init() {
        self.data = Deep1{
            lvl2: Deep2{
                lvl3: Deep3{
                    var1: 999,
                    var2: true
                }
            }
        };
    }
}