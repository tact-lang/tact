struct NestedOpt {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Address?;
}

contract OptFields {
    p1: NestedOpt?;
    p2: NestedOpt?;

    init() {
        self.p1 = null;
        self.p2 = null;
    }
}