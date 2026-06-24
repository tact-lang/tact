struct S1 {
    f1: Int;
    f2: String;
    f3: Bool;
}

struct S2 {
    inner: S1;
    flag: Bool;
    comment: String;
}

struct S3 {
    nested: S2;
    val: Int;
}

contract ComplexNested {
    s: S3 = S3{
        nested: S2{
            inner: S1{f1: 1, f2: "hi", f3: false},
            flag: true,
            comment: "nested"
        },
        val: 100
    };

    init() {
        self.s = S3{
            nested: S2{
                inner: S1{f1: 2, f2: "bye", f3: true},
                flag: false,
                comment: "deep"
            },
            val: 200
        };
    }
}
