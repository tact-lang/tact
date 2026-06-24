struct SubInner {
    p: Int?;
}

struct MiddleOpt {
    sub: SubInner?;
}

contract DoubleOptionWrap {
    data: MiddleOpt;

    init() {
        self.data = MiddleOpt{sub: null};
    }
}
