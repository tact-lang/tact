struct VeryDeep {
  a: S1;
}

struct S1 { b: S2; }
struct S2 { c: S3; }
struct S3 { d: S4; }
struct S4 { e: S5; }
struct S5 { f: S6; }
struct S6 { g: S7; }
struct S7 { h: S8; }
struct S8 { i: Int; }

contract TestContract {
  val: VeryDeep;
  init() {
    self.val = VeryDeep{
      a: S1{ b: S2{ c: S3{ d: S4{ e: S5{ f: S6{ g: S7{ h: S8{ i: 123 } } } } } } } }
    };
  }
}