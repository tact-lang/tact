struct LeafOpt {
    n: Int?;
}

struct MiddleOpt {
    leaf: LeafOpt?;
}

contract OptInOptStructField {
    mid: MiddleOpt;

    init() {
        self.mid = MiddleOpt{leaf: null};
    }
}