struct S1 { a: Int; }
struct S2 { a: Int; b: Int?; c: Bool; d: Int; e: Int?; }
struct S3 { s1: S1; s2: S2; z: Int; }

contract TestManyFields {
    storage: S3;

    init() {
        self.storage = S3{
            s1: S1{ a:1 },
            s2: S2{ a:2, b:null, c:true, d:4, e:null },
            z: 10
        };
    }
}
