struct S1 { x: Int; }
struct S2 { y: S1?; }
struct S3 { z: S2?; }

contract MultiOptNested {
    data: S3;

    init() {
        self.data = S3{
            z: S2{
                y: S1{ x: 42 }
            }
        };
    }
}