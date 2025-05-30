struct OptsInOpts {
    inner: Int?;
}

contract TestContract {
    outer: OptsInOpts?;

    init() {
        self.outer = OptsInOpts{inner: null};
    }
}