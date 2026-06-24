struct NestedOpt {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract NullDefaults {
    n: NestedOpt;

    init() {
        self.n = NestedOpt{ s: null, i: null, b: null };
    }
}