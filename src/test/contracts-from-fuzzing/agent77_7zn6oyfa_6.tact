struct Inner1 { a: Int; }
struct Inner2 { b: Int; }
struct Inner3 { c: Bool; }
struct Inner4 { d: Bool; }

struct Middle {
  i1: Inner1;
  i2: Inner2;
  i3: Inner3;
  i4: Inner4;
}

contract NestedWide {
  mid: Middle;

  init() {
    self.mid = Middle{
      i1: Inner1{ a:1 },
      i2: Inner2{ b:2 },
      i3: Inner3{ c:true },
      i4: Inner4{ d:false }
    };
  }
}