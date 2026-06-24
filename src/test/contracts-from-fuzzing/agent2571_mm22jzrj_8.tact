struct SSS {
    a: Int;
    b: Bool;
    c: String;
}

contract Replicated {
    s1: SSS;
    s2: SSS;
    s3: SSS;

    init() {
        self.s1 = SSS{a: 1, b: true, c: "1"};
        self.s2 = SSS{a: 2, b: false, c: "2"};
        self.s3 = SSS{a: 3, b: true, c: "3"};
    }
}
