struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    b: Bool?;
}

struct S3 {
    s2: S2;
    c: String;
}

contract TestContract {
    nestedStruct: S3;
    init() {
        self.nestedStruct = S3{s2: S2{s1: S1{a:1}, b:null}, c: "abc"};
    }
}