struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: String?;
    d: Int?;
}

struct S3 {
    s1: S1;
    s2: S2;
    flag: Bool?;
    text: String;
}

contract NestedOptionals {
    val: S3;

    init() {
        self.val = S3{
            s1: S1{ a: 7, b: true },
            s2: S2{ c: null, d: 9 },
            flag: null,
            text: "foo",
        };
    }
}