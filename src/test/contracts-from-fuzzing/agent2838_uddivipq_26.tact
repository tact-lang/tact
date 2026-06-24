struct S1 { x: Int; }
struct S2 { x: S1; }
struct S3 { x: S2; }
contract LongNested {
    val: S3;

    init() {
        self.val = S3{ x: S2{ x: S1{ x: 9 } } };
    }
}