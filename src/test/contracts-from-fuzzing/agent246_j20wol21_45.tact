struct WrapBool {
    flag: Bool;
}

contract WrapFields {
    w1: WrapBool;
    w2: WrapBool;
    w3: WrapBool;

    init() {
        self.w1 = WrapBool{flag:true};
        self.w2 = WrapBool{flag:false};
        self.w3 = WrapBool{flag:true};
    }
}
