struct NestedOpt {
    val: Int?;
}

contract TestContract {
    opt: NestedOpt?;

    init() {
        self.opt = NestedOpt{ val: 5 };
    }
}