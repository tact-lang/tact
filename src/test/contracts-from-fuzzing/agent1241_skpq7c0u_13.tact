struct VeryDeep {
    d: Deep4;
}

struct Deep4 {
    d3: Deep3;
}

struct Deep3 {
    d2: Deep2;
}

struct Deep2 {
    d1: Deep1;
}

struct Deep1 {
    x: Int;
}

contract MoreDeep {
    val: VeryDeep;

    init() {
        self.val = VeryDeep{
            d: Deep4{
                d3: Deep3{
                    d2: Deep2{
                        d1: Deep1{
                            x: 99,
                        }
                    }
                }
            }
        };
    }
}
