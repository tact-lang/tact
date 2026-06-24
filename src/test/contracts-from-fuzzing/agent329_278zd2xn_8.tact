struct NestedOpt {
    innerOpt: Int?;
}

contract TestContract {
    data: NestedOpt?;

    init() {
        self.data = null;
    }
}