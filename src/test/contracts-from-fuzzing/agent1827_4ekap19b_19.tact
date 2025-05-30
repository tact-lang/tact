struct MiddleOpt {
    num: Int?;
}

struct OuterOpt {
    mid: MiddleOpt?;
}

contract NullableMiddleStruct {
    outer: OuterOpt;

    init() {
        self.outer = OuterOpt { mid: null };
    }
}