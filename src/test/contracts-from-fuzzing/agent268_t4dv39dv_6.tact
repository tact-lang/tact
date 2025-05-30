struct NestedOptional {
    innerOpt: Bool?;
}

contract TestContract {
    outerOpt: NestedOptional?;
    init() {
        self.outerOpt = null;
    }
}