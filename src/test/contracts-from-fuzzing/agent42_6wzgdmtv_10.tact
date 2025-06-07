struct A { x: Int; y: Bool; }
struct B { b: A; }
struct C { c: B; }
struct D { d: C; }
struct E { e: D; }
struct F { f: E; }
struct G { g: F; }
struct H { h: G; }

contract TestContract {
  nested: H;

  init() {
    self.nested = H{ h:G{ g:F{ f:E{ e:D{ d:C{ c:B{ b:A{ x:1, y:true } } } } } } } };
  }
}