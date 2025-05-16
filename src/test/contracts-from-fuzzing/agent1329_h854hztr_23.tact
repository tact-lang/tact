struct OptEmbedded {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract NullableEmbedded {
    oe: OptEmbedded;

    init() {
        self.oe = OptEmbedded{ s:null, b:null, i:null };
    }
}