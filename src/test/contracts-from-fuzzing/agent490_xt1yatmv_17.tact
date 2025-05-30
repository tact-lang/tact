struct S1 { a: Int; }
struct S2 { b: Bool; s1: S1; }
struct S3 { c: String; s2: S2; }

contract NestedMix {
    d: S3;

    init() {
        self.d = S3{
            c: "hi",
            s2: S2{
                b:true,
                s1:S1{a:42}
            }
        };
    }
}