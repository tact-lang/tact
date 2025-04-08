struct OptInner {
    val: Int?;
    flag: Bool?;
}

contract Test {
    opt: OptInner;

    init() {
        self.opt = OptInner{ val: null, flag: true };
    }
}