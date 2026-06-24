struct Inner1 { a: Int; }
struct Inner2 { b: Int; c: Bool; }
struct Inner3 { d: String; e: Bool?; }

struct Combo {
  i1: Inner1;
  i2: Inner2;
  i3: Inner3;
  opt: Int?;
}

contract Test {
  data: Combo;

  init() {
    self.data = Combo{
      i1: Inner1{ a:1 },
      i2: Inner2{ b:2, c:true },
      i3: Inner3{ d:"abc", e:null },
      opt: 42
    };
  }
}