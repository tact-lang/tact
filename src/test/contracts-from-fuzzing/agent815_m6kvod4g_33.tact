struct SOpt {
    foo: Int?;
}

contract OptStruct {
    s: SOpt?;

    init() {
        self.s = null;
    }
}