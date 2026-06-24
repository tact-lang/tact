struct SInner {
    a: Int;
    b: Bool;
}

struct SOuter {
    in1: SInner;
    in2: SInner?;
    in3: SInner;
}

contract FieldStructs {
    aa: SOuter;

    init() {
        self.aa = SOuter{
            in1: SInner{a:1,b:true},
            in2: null,
            in3: SInner{a:2,b:false}
        };
    }
}