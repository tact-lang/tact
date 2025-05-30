struct S1 { a: Int; }
struct S2 { b: Int; }
struct S3 { c: Int; }

contract Test35 {
    val1: S1;
    val2: S2;
    val3: S3;
    init() {
        self.val1 = S1{a:1};
        self.val2 = S2{b:2};
        self.val3 = S3{c:3};
    }
}