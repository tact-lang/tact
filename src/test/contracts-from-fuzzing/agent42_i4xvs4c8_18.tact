struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: Address }
struct S4 { d: String? }
struct S5 { e: Int? }

contract AllTypesMixed {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;

    init() {
        self.s1 = S1{a:1};
        self.s2 = S2{b:true};
        self.s3 = S3{c:myAddress()};
        self.s4 = S4{d: null};
        self.s5 = S5{e: null};
    }
}