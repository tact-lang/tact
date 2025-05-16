struct S1 { a: Int; b: Bool; }
struct S2 { c: String; d: Slice; }
struct S3 { s1: S1; s2: S2; e: Address; }

contract MultiStructs {
    s3: S3;
    init() {
        self.s3 = S3{
            s1: S1{a:1,b:true},
            s2: S2{c:"hi", d: emptyCell().asSlice()},
            e: myAddress()
        };
    }
}