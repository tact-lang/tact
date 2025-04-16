struct S1 {
    f1: Int;
}
struct S2 {
    f2: Int;
}
struct S3 {
    f3: String;
}
struct S4 {
    f4: Bool;
}

contract ManyStructs {
    a: S1;
    b: S2;
    c: S3;
    d: S4;

    init() {
        self.a = S1{f1:1};
        self.b = S2{f2:2};
        self.c = S3{f3:"abc"};
        self.d = S4{f4:true};
    }
}