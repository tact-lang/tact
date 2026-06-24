struct Composite {
    a: Int;
    b: Bool?;
    c: String?;
}

contract NullableCompositeArray {
    s1: Composite?;
    s2: Composite?;
    s3: Composite?;

    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = null;
    }
}