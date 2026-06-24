struct Small {
    x: Int;
}

contract InlineStructs {
    s1: Small;
    s2: Small;
    s3: Small;

    init() {
        self.s1 = Small{x: 1};
        self.s2 = Small{x: 2};
        self.s3 = Small{x: 3};
    }
}