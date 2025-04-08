struct A { i: Int; }
struct B { s: String; }
struct C { b: Bool; }

struct Nest {
  a: A;
  b: B;
  c: C;
}

contract DeepStructs {
 val: Nest;
 init() {
  self.val = Nest{a:A{i:1}, b:B{s:"s"}, c:C{b:true}};
 }
}