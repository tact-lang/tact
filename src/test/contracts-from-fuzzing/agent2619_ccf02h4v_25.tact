struct BoolDeepNest {
    inner: BoolNest1;
}

struct BoolNest1 {
    inner: BoolNest2;
}

struct BoolNest2 {
    val: Bool;
}

contract BoolDeep {
    v: BoolDeepNest;

    init() {
        self.v = BoolDeepNest{
            inner: BoolNest1{
                inner: BoolNest2{ val:true }
            }
        };
    }
}