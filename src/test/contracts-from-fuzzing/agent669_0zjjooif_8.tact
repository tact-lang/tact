struct S1 { x: Int }
struct S2 { y: Bool }
struct S3 { z: String }

struct Layered {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract NestedLayers {
    val: Layered;

    init() {
        self.val = Layered{
            s1: S1{ x: 1 },
            s2: S2{ y: false },
            s3: S3{ z: "wow" }
        };
    }
}