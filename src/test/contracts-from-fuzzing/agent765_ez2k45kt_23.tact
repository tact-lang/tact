struct S1 {
    f1: Int;
    f2: Bool;
}

struct S2 {
    s1: S1;
    extra: Int;
}

struct S3 {
    s2: S2;
    text: String;
}

contract TestContract {
    nested: S3;

    init() {
        self.nested = S3{
            s2: S2{ s1: S1{f1:1,f2:true}, extra:5 },
            text: "str" };
    }
}