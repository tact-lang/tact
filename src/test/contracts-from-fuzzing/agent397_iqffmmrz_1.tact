struct NestedOpt {
    value: Int?;
}

contract TestContract {
    data: NestedOpt?;

    init() {
        self.data = null;
    }
}