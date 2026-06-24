struct S1 { a: Int; b: Bool; }
struct S2 { c: Int; d: Bool; }
struct S3 { s1: S1; s2: S2; e: String; }

contract ChainNested {
    var: S3;

    init() {
        self.var = S3{
          s1: S1{a:1, b:true},
          s2: S2{c:2,d:false},
          e: "x"
        };
    }
}