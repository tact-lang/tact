struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    optInt: Int?;
}

struct S3 {
    s2: S2;
    str: String;
}

contract MixedDeep {
    val: S3;
    init() {
        self.val = S3{
            s2: S2{s1: S1{a:9}, optInt:null},
            str:"hi"
        };
    }
}