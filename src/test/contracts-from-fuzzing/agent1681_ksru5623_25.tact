struct NestedOpt {
    s1: Int?;
    s2: Bool?;
    s3: String?;
}

contract OptionalStructField {
    s: NestedOpt?;
    init() {
        self.s = null;
    }
}