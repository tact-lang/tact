struct S1 { x: Int; }
struct S2 { y: S1; }
struct S3 { z: S2; }

contract DeepStruct {
    field: S3;

    init() {
        self.field = S3{z: S2{y: S1{x:42}}};
    }
}