struct InnerOpt {
    val: Int?;
}

struct MiddleOpt {
    inner: InnerOpt?;
}

contract OuterOptional {
    mid: MiddleOpt?;

    init() {
        self.mid = MiddleOpt{ inner: InnerOpt{ val: 5 } };
    }
}