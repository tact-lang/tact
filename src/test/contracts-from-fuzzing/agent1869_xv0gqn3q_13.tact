struct OptStruct {
    a: Int;
}

contract OptionalStructField {
    s1: OptStruct?;
    s2: OptStruct?;

    init() {
        self.s1 = null;
        self.s2 = null;
    }
}