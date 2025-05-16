struct S1 { x: Int; y: Int; }
struct S2 { s1: S1; z: Int; }
struct S3 { s2: S2; w: Int; }

contract ReassignInInit {
    data: S3;
    init() {
        self.data = S3{
            s2: S2{
                s1: S1{ x: 1, y: 2 },
                z: 3
            },
            w: 4
        };
        // overwrite nested
        self.data.s2.s1.x = 10;
    }
}