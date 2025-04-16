contract ManyNullableNested {
    s1: Int?;
    s2: Int?;
    s3: Bool?;
    s4: Bool?;

    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = null;
        self.s4 = null;
    }
}