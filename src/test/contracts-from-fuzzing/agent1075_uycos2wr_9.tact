struct SOpt {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalStructFieldDefaults {
    data: SOpt;
    init() {
        self.data = SOpt{ i: null, b: null, s: null };
    }
}