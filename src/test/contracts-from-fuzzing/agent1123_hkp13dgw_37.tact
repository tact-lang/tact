struct WrappedOpt {
    foo: Int?;
}

contract OptField {
    w: WrappedOpt?;

    init() {
        self.w = null;
    }
}