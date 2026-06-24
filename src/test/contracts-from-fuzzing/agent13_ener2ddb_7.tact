struct OptStruct {
    a: Int;
    b: Bool;
}

contract OptionalFields {
    opt1: OptStruct?;
    opt2: OptStruct?;
    opt3: Int?;

    init() {
        self.opt1 = OptStruct{ a: 42, b: true };
        self.opt2 = null;
        self.opt3 = 7;
    }
}