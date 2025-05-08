struct S1 { x: Int?; }
struct S2 { y: Bool?; }
struct S3 { z: String?; }

struct Container {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract TestContract {
    s: Container;
    init() {
        self.s = Container{
            s1: S1{ x: null },
            s2: S2{ y: true },
            s3: S3{ z: null }
        };
    }
}