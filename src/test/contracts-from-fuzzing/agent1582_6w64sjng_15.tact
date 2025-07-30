struct WrapBool {
    flag: Bool;
}

contract ArrayMimicUnrolled {
    e1: WrapBool;
    e2: WrapBool;
    e3: WrapBool;
    init() {
        self.e1 = WrapBool{flag:true};
        self.e2 = WrapBool{flag:false};
        self.e3 = WrapBool{flag:true};
    }
}