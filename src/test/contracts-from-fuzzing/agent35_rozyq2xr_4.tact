struct BoolNest {
    b1: Bool;
    b2: Bool;
    inner: InnerBool;
}

struct InnerBool {
    x: Bool;
    y: Bool;
    z: Bool;
}

contract BoolNestContract {
    boolNest: BoolNest;
    init() {
        self.boolNest = BoolNest{
            b1:true,b2:false,
            inner: InnerBool{ x:true,y:false,z:true }
        };
    }
}