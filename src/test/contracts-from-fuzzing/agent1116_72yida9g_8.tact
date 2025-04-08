struct Sub1 { a: Int; }
struct Sub2 { b: Bool; }
struct Sub3 { c: Address; }
struct All {
  s1: Sub1;
  s2: Sub2;
  s3: Sub3;
}

contract ComplexFields {
  val: All;
  sub: Sub2;

  init() {
    self.val = All{ s1: Sub1{a:1}, s2: Sub2{b:true}, s3: Sub3{c:myAddress()} };
    self.sub = Sub2{b:false};
  }
}
