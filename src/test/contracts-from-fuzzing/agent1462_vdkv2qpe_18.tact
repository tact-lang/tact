struct SOpt {
    a: Int;
    b: Bool;
}

contract WrappedOpt {
    optfield: SOpt?;

    init() {
        self.optfield = null;
    }
}