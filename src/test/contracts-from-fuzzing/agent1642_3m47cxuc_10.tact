struct BigNestedOptional {
    s1: String?;
    i1: Int?;
    b1: Bool?;
    s2: String?;
    i2: Int?;
    b2: Bool?;
    s3: String?;
    i3: Int?;
    b3: Bool?;
}

contract LotsOfOptionals {
    inner: BigNestedOptional?;

    init() {
        self.inner = null;
    }
}