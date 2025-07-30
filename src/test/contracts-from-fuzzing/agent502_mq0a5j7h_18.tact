struct OptStruct {
    v: Int?;
}

contract OptionalStruct {
    s: OptStruct?;

    init() {
        self.s = null;
    }
}