struct S1 { a: Int }
struct S2 { b: Int }
struct S3 { c: Int }
struct S4 { d: Int }
struct S5 { e: Int }

contract ManyStructs {
    s1: S1 = S1{a:1};
    s2: S2 = S2{b:2};
    s3: S3 = S3{c:3};
    s4: S4 = S4{d:4};
    s5: S5 = S5{e:5};

    init() {
        self.s1 = S1{a:10};
        self.s2 = S2{b:20};
        self.s3 = S3{c:30};
        self.s4 = S4{d:40};
        self.s5 = S5{e:50};
    }
}