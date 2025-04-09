struct S1 {
    i: Int;
}
struct S2 {
    b: Bool;
}
struct S3 {
    s: String;
}

contract ManyStructs {
    a: S1;
    b: S2;
    c: S3;

    init() {
        self.a = S1{i: 7};
        self.b = S2{b: true};
        self.c = S3{s: "hi"};
    }
}