struct InnerDefOpt {
    a: Int? = null;
    b: Bool = true;
}

contract NestedOptDefault {
    val: InnerDefOpt?;

    init() {
        self.val = null;
    }
}