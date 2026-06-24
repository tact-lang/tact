struct Chain1 {
    lvl2: Chain2;
}

struct Chain2 {
    lvl3: Chain3;
}

struct Chain3 {
    val: Int;
}

contract ChainDepth {
    root: Chain1;

    init() {
        self.root = Chain1{
            lvl2: Chain2{
                lvl3: Chain3{
                    val: 99
                }
            }
        };
    }
}