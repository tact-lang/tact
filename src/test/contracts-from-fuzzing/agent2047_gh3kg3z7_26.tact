struct OptionalStruct {
    v: Int?;
    f: Bool?;
    s: String?;
}

contract ComplexOptFields {
    s1: OptionalStruct?;
    s2: OptionalStruct;

    init() {
        self.s1 = null;
        self.s2 = OptionalStruct{ v:null, f:null, s:null };
    }
}