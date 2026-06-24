struct OptInt {
    val: Int?;
}

struct OptBool {
    val: Bool?;
}

contract OptMix {
    oi: OptInt;
    ob: OptBool;

    init() {
        self.oi = OptInt{val:null};
        self.ob = OptBool{val:null};
    }
}