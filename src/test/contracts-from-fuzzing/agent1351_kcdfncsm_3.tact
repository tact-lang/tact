struct Deep1 { num: Int }
struct Deep2 { d1: Deep1 }
struct Deep3 { d2: Deep2 }
struct Deep4 { d3: Deep3 }
struct Deep5 { d4: Deep4 }

contract UltraDeep {
    deepVal: Deep5;

    init() {
        self.deepVal = Deep5{
            d4: Deep4{
                d3: Deep3{
                    d2: Deep2{
                        d1: Deep1{ num: 99 }
                    }
                }
            }
        };
    }
}