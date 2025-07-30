struct Deep3 {
    val: Int;
}

struct Deep2 {
    d3: Deep3;
}

struct Deep1 {
    d2: Deep2;
}

contract DeepNest {
    nested: Deep1;

    init() {
        self.nested = Deep1 {
            d2: Deep2 {
                d3: Deep3 {
                    val: 999
                }
            }
        };
    }
}
