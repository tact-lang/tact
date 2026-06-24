struct A { a: Bool; }
struct B { b: Bool; }
struct C { c: Bool; }
struct D { d: Bool; }

struct ComboBool {
  a: A; b: B; c: C; d: D;
}

contract ManyNestedBools {
  val: ComboBool;

  init() {
    self.val = ComboBool{
      a: A{a:true}, b: B{b:false}, c: C{c:true}, d: D{d:false}
    };
  }
}