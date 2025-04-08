struct Inner {
    f: Int = 42;
}

contract OptionalNested {
    innerOpt: Inner?;

    init() {
        self.innerOpt = null;
    }
}
