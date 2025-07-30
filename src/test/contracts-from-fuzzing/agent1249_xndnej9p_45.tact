struct Inner {
    x: Int;
}

contract NestedSameTypeOptionals {
    innerOpt1: Inner?;
    innerOpt2: Inner?;

    init() {
        self.innerOpt1 = null;
        self.innerOpt2 = null;
    }
}