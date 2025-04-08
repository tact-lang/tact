struct S1 { val: Int }
struct S2 { val: Int }
struct S3 { val: Int }

contract NestedWide {
    a: S1;
    b: S2;
    c: S3;

    init() {
        self.a = S1{ val: 1 };
        self.b = S2{ val: 2 };
        self.c = S3{ val: 3 };
    }
}