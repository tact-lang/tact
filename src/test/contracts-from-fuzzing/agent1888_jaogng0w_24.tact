struct S1 { a: Int; b: Bool; }
struct S2 { c: String; d: Cell; }
struct S3 { e: Address; f: Int?; }

struct Combo {
  s1: S1;
  s2: S2;
  s3: S3;
}

contract Combined {
  data: Combo;

  init() {
    self.data = Combo{
      s1: S1{a:1,b:true},
      s2: S2{c:"a",d:emptyCell()},
      s3: S3{e:myAddress(),f:null}
    };
  }
}
