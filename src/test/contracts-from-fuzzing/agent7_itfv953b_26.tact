struct ChainA {
    val: Int;
}

struct ChainB {
    a: ChainA;
}

struct ChainC {
    b: ChainB;
}

struct ChainD {
    c: ChainC;
}

contract VeryDeep {
    deep: ChainD;

    init() {
        self.deep = ChainD{
            c: ChainC{
                b: ChainB{
                    a: ChainA{ val: 7 }
                }
            }
        };
    }
}