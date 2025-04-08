struct OptStruc {
    int1: Int?;
    int2: Int?;
}

contract OptionalStructsMany {
    s1: OptStruc?;
    s2: OptStruc?;
    s3: OptStruc?;

    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = null;
    }
}