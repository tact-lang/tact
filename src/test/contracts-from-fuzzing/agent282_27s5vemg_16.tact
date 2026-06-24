struct Innermost { a: Int; b: Bool; }
struct Inner { c: Innermost; d: String; }
struct Outer { e: Inner; f: Int; }

contract TripleNest {
  x: Outer;
  init() {
    self.x = Outer{ e: Inner{ c: Innermost{a:1,b:true}, d:"zzz" }, f: 42 };
  }
}