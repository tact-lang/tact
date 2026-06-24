struct InnerOpt {
    val: Int?;
}

contract OptionalInsideStruct {
    s: InnerOpt;

    init() {
        self.s = InnerOpt{ val: null };
    }
}