// Contract with many nested structs with optionals of primitives
struct S1 { a: Int?; }
struct S2 { s1: S1?; }
struct S3 { s2: S2?; }

contract MultiLayerOptStructs {
    data: S3;

    init() {
        self.data = S3{s2: null};
    }
}
