struct NestedOpt {
    val: Int?;
}

contract Test {
    obj: NestedOpt;

    init() {
        self.obj = NestedOpt{ val: null };
    }
}