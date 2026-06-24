struct InnerOpt {
    val: Int?;
    flag: Bool;
}

contract OptNested {
    s: InnerOpt?;

    init() {
        self.s = InnerOpt{ val: null, flag: true };
    }
}