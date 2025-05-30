struct ND {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptDefaults {
    v: ND;
    init() {
        self.v = ND{
            a: null,
            b: null,
            c: null,
        };
    }
}