struct NestedOpt {
    innerOpt: Int?;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{ innerOpt: null };
    }
}