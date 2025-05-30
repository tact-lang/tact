struct S1 { a: Int; }
struct S2 { b: Int; }
struct S3 { c: Int; }
struct Combo {
  one: S1;
  two: S2;
  three: S3;
}

contract MultiStruct {
  val: Combo;

  init() {
    self.val = Combo{
      one: S1{a:1},
      two: S2{b:2},
      three: S3{c:3}
    };
  }
}