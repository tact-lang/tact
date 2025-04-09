struct X {
 a: Int;
 b: Bool;
 c: Int?;
 d: Bool?;
}

contract ReassignNulls {
  val: X;
  init() {
    self.val = X{ a:1, b:true, c:2, d:false };
    self.val.c = null;
    self.val.d = null;
  }
}