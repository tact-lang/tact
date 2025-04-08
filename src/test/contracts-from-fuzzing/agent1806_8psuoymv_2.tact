struct Deep {
    n1: Int;
    n2: Bool;
}

struct Middle {
    mid1: Deep;
    mid2: Deep;
}

struct Outer {
    out1: Middle;
    out2: Middle;
}

contract DeepNestTest {
    value: Outer;
    init() {
        self.value = Outer{
            out1: Middle{
                mid1: Deep{n1:1, n2:true},
                mid2: Deep{n1:2, n2:false}
            },
            out2: Middle{
                mid1: Deep{n1:3, n2:true},
                mid2: Deep{n1:4, n2:false}
            }
        };
    }
}