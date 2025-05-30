struct OptStruct {
    x: Int;
}

contract TestOptionalStruct {
    s: OptStruct?;

    init() {
        self.s = null;
    }

    receive() {
        self.s = OptStruct{x: 42};
    }
}
