struct S {
    a: Int;
    b: Bool?;
    c: String;
}

contract StructArrayLike {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{ a: 1, b: true, c: "one" };
        self.s2 = S{ a: 2, b: null, c: "two" };
        self.s3 = S{ a: 3, b: false, c: "three" };
    }
}