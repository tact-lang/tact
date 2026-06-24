struct X1 { a: Int; }
struct X2 { a: Bool; }
struct X3 { a: String; }
struct XWrap { s1: X1; s2: X2; s3: X3; }

contract DiffPrimWrap {
  data: XWrap;
  init() {
    self.data = XWrap{
      s1: X1{a:1},
      s2: X2{a:true},
      s3: X3{a:"abc"}
    };
  }
}