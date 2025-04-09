struct S1 { x: Int; }
struct S2 { x: S1; }
struct S3 { x: S2; }
contract DeepThreeLevels {
    val: S3 = S3{ x: S2{ x: S1{ x: 42 } } };
    receive() {
        let _ = self.val.x.x.x;
    }
}