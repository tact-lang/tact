struct MultiOptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract Test {
    s1: MultiOptionalStruct?;
    s2: MultiOptionalStruct?;
    init() {
        self.s1 = null;
        self.s2 = null;
    }
}