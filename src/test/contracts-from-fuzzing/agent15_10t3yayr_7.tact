struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    a: Int;
    b: Bool;
}

struct S3 {
    s1: S1;
    s2: S2;
}

contract StructsInStruct {
    s: S3;

    init() {
        self.s = S3{
            s1: S1{ a:1, b:true },
            s2: S2{ a:2, b:false },
        };
    }
}