struct NestedOpt {
    val: Int?;
}

contract StorageOpt {
    opt: NestedOpt?;

    init() {
        self.opt = NestedOpt{ val: null };
    }
}