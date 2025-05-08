struct BigOptDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract ManyBigDefaults {
    v1: BigOptDefaults?;
    v2: BigOptDefaults?;

    init() {
        self.v1 = null;
        self.v2 = null;
    }
}
