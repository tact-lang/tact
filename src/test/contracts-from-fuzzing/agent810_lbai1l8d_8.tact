struct Sub {
    foo: Int;
}

contract MultiOptionalStruct {
    opt1: Sub?;
    opt2: Sub?;
    init() {
        self.opt1 = null;
        self.opt2 = null;
    }
}
