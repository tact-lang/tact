struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

struct ManyNested {
  na: A;
  nb: B;
  nc: C;
}

contract MultiNestedStructs {
  f: ManyNested;

  init() {
    self.f = ManyNested{
      na: A{a:1},
      nb: B{b:2},
      nc: C{c:3}
    };
  }
}