struct SInner {
    val: Int;
}

struct SOuter {
    in1: SInner;
    in2: SInner;
    in3: SInner;
}

contract MultipleNestedStructs {
    rec: SOuter;
    init() {
        self.rec = SOuter{
            in1: SInner{val:1},
            in2: SInner{val:2},
            in3: SInner{val:3},
        };
    }
}