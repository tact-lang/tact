struct BoolLayer3 {
    c1: Bool;
    c2: Bool;
}

struct BoolLayer2 {
    b1: BoolLayer3;
    b2: BoolLayer3;
}

struct BoolLayer1 {
    a1: BoolLayer2;
    a2: BoolLayer2;
}

contract NestedBoolLayers {
    data: BoolLayer1;

    init() {
        self.data = BoolLayer1{
            a1: BoolLayer2{
                b1: BoolLayer3{c1:true, c2:false},
                b2: BoolLayer3{c1:false, c2:true},
            },
            a2: BoolLayer2{
                b1: BoolLayer3{c1:true, c2:true},
                b2: BoolLayer3{c1:false, c2:false},
            },
        };
    }
}