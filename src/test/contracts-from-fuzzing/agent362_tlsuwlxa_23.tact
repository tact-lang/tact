struct OptionalStruct {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract TestContract {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }

    receive() {
        self.opt = OptionalStruct{ i: 1, b: false, s: "x" };
    }
}