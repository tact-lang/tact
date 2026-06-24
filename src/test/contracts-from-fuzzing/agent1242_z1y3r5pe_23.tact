struct S0 { x: Int? }
struct S1 { x: S0? }
struct S2 { x: S1? }
struct S3 { x: S2? }
struct S4 { x: S3? }

contract Test {
    val: S4;

    init() {
        self.val = S4{ x: null };
    }
}
