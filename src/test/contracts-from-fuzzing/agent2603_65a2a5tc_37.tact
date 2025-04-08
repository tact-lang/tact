struct WrapBool {
    val: Bool;
}

struct WrapInt {
    val: Int;
}

contract MixWrapper {
    wbool: WrapBool;
    wint: WrapInt;

    init() {
        self.wbool = WrapBool{ val: true };
        self.wint = WrapInt{ val: 42 };
    }
}
