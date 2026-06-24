// test many nested structs, each with optional fields
struct S1 { x: Int?; next: S2; }
struct S2 { y: Int?; next: S3; }
struct S3 { z: Int?; }

contract ChainOpt {
    data: S1;
    init() {
        self.data = S1{
            x: null,
            next: S2{
                y: null,
                next: S3{z:null}
            }
        };
    }
}
