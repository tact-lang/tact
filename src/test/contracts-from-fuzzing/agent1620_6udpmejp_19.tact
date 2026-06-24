struct SA {
    a: Int;
}

struct SB {
    b: Bool;
}

struct SC {
    c: String;
}

contract DifferentStructs {
    s1: SA;
    s2: SB;
    s3: SC;

    init() {
        self.s1 = SA{ a: 1 };
        self.s2 = SB{ b: true };
        self.s3 = SC{ c: "hi" };
    }
}