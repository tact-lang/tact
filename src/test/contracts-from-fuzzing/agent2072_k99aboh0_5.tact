struct VeryDeep {
    v: Int;
}

struct Deep4 {
    d: VeryDeep;
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

contract DeepNestTest {
    root: Deep1;

    init() {
        self.root = Deep1{
            d2: Deep2{
                d3: Deep3{
                    d4: Deep4{
                        d: VeryDeep{ v: 77 }
                    }
                }
            }
        };
    }
}