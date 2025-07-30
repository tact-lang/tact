struct S1 {
    x: Int;
    y: String;
}

struct S2 {
    s1: S1;
    flag: Bool;
    n: Int;
}

struct S3 {
    s2: S2;
    s21: S2;
}

contract TestContract {
    sNested: S3;

    init() {
        self.sNested = S3{
            s2: S2{ s1: S1{ x:1,y:"a" }, flag:true, n:5 },
            s21: S2{ s1: S1{ x:2,y:"b" }, flag:false, n:10 }
        };
    }
}