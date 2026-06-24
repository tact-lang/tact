struct OptionalStruct {
    x: Int;
}

contract TestContract {
    opt: OptionalStruct?; // no explicit default, should be implicit null

    init() {
        if (self.opt == null) {
            self.opt = OptionalStruct{ x: 1 };
        }
    }

    receive() {
        self.opt = null;
    }
}