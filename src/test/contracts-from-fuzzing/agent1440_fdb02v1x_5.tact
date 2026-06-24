struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    val: Int;
}

struct S3 {
    s2: S2;
    flag: Bool?;
}

contract NestedStructs {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{ a: 2, b: false },
                val: 3
            },
            flag: true
        };
    }
}