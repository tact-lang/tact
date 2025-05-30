struct SomeOpt {
    inner: Int;
}

contract ExplicitNullOpt {
    val: SomeOpt?;

    init() {
        self.val = null;
    }
}