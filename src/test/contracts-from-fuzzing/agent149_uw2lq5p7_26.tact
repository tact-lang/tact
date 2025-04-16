struct ChainMany {
    n1: N1;
}

struct N1 {
    n2: N2;
}

struct N2 {
    n3: N3;
}

struct N3 {
    n4: N4;
}

struct N4 {
    n5: N5;
}

struct N5 {
    val: Int;
}

contract DeepChainMany {
    data: ChainMany;

    init() {
        self.data = ChainMany{
            n1: N1{
                n2: N2{
                    n3: N3{
                        n4: N4{
                            n5: N5{ val: 7 }
                        }
                    }
                }
            }
        };
    }
}