struct Deep1 {
    val: Int;
}

struct Deep2 {
    d1: Deep1;
}

struct Deep3 {
    d2: Deep2;
}

struct Deep4 {
    d3: Deep3;
}

contract Test {
    data: Deep4;

    init() {
        self.data = Deep4{
            d3: Deep3{
                d2: Deep2{
                    d1: Deep1{
                        val: 42
                    }
                }
            }
        };
    }
}
