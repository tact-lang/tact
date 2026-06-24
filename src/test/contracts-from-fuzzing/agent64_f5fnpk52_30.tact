struct WithInnerOpt {
    a: Int;
    inner: Int?;
}

contract NullableInnerWithPrim {
    dat: WithInnerOpt?;

    init() {
        self.dat = WithInnerOpt{a: 7, inner: null};
    }

    receive() {
        self.dat = null;
    }
}