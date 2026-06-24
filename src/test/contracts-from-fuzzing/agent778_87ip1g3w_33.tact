struct AStrOpt {
    s: String?;
    x: Int;
}

contract OptStringStruct {
    val: AStrOpt;
    init() {
        self.val = AStrOpt{ s: null, x: 42 };
    }
}