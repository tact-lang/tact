struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract DoubleOptionals {
    s1: OptStruct?;
    s2: OptStruct?;

    init() {
        self.s1 = null;
        self.s2 = null;
    }
}