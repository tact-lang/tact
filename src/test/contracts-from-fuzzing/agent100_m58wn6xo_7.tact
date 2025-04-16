struct Nill {
    v1: Int?;
    v2: Bool?;
    v3: String?;
}

contract NullDefaults {
    s: Nill;

    init() {
        self.s = Nill{
            v1: null,
            v2: null,
            v3: null
        };
    }
}
