struct S1 { a: Int; b: Bool; }
struct S2 { a: String; b: Address; }
struct S3 { x: S1; y: S2; }

contract NestedMultiTypes {
    f: S3;

    init() {
        self.f = S3{
            x: S1{a:1,b:true},
            y: S2{a:"abc",b:myAddress()},
        };
    }
}
