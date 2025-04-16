struct Deep4 {
    deepVal: Bool?;
}

struct Deep3 {
    d4: Deep4;
}

struct Deep2 {
    d3: Deep3;
}

struct Deep1 {
    d2: Deep2;
}

contract DeepAssign {
    s: Deep1;

    init() {
        self.s = Deep1{
            d2: Deep2{
                d3: Deep3{
                    d4: Deep4{
                        deepVal: true
                    }
                }
            }
        };
    }
}