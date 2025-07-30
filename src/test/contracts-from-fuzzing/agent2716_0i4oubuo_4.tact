struct S1 { a: Int; }
struct S2 { b: S1; c: Int; }

contract SameNameFields {
  x: S2;
  y: S2;

  init() {
    self.x = S2{b: S1{a:1}, c:2};
    self.y = S2{b: S1{a:3}, c:4};
  }
}