struct NestedOptional {
    innerOpt: Bool?;
}

contract TestContract {
    data: NestedOptional?;

    init() {
        self.data = null;
    }
}