struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }

contract ManyStructs {
    f1: S1;
    f2: S2;
    f3: S3;

    init() {
        self.f1 = S1{a: 10};
        self.f2 = S2{b: true};
        self.f3 = S3{c: "hi"};
    }
}