struct NestedOptional {
    innerOpt: String?;
    boolOpt: Bool?;
}

contract TestContract {
    topOpt: NestedOptional?;

    init() {
        self.topOpt = null;
    }

    receive() {}
}