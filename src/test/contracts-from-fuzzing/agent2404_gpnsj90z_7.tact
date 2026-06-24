struct S1 { x: Int; }
struct S2 { y: Bool; }
struct S3 { s1: S1; s2: S2; }
struct S4 { s3: S3; z: Int; }

contract TestContract {
    persistent: S4;
    init() {
        self.persistent = S4{
            s3: S3{ s1: S1{x: 5}, s2: S2{y: true} },
            z: 100
        };
    }
}