struct MidOpt {
    n: Int?;
    b: Bool?;
}

struct OuterOptLayer {
    mid1: MidOpt?;
    mid2: MidOpt?;
}

contract DoubleNullableStruct {
    f: OuterOptLayer;
    init() {
        self.f = OuterOptLayer{mid1:null, mid2:null};
    }
}