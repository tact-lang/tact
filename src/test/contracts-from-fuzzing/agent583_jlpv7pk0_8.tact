struct Small {
    x: Int;
}

contract OptionalStructFields {
    s1: Small?;
    s2: Small?;
    s3: Small?;

    init() {
        self.s1 = Small{ x: 1 };
        self.s2 = null;
        self.s3 = Small{ x: 3 };
    }
}