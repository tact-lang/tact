struct NestedOptionStruct {
    flag: Bool;
    comment: String?;
}

contract OptNestedOpt {
    maybeInner: NestedOptionStruct?;
    flag: Bool?;

    init() {
        self.maybeInner = NestedOptionStruct{ flag: true, comment: null };
        self.flag = null;
    }
}
