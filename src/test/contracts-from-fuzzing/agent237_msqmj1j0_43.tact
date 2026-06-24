struct BoolNest {
    b1: Bool;
    b2: Bool?;
}

struct IntNest {
    i1: Int;
    i2: Int?;
}

struct ComboDeep {
    boolNest: BoolNest?;
    intNest: IntNest?;
}

contract Crosses {
    data: ComboDeep;
    init() {
        self.data = ComboDeep{boolNest:null,intNest:null};
    }
}