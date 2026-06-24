struct DeepOptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapDeepOpt {
    s: DeepOptStruct?;
}

contract OptWrap {
    val: WrapDeepOpt;

    init() {
        self.val = WrapDeepOpt{ s: null };
    }
}