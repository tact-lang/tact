// Persistent struct with nested large struct and top level other fields
struct InnerLarge {
  a: Int;
  b: Bool;
  c: String;
  d: Int;
}

struct OuterBig {
  inner: InnerLarge;
  x: Int;
  y: Bool;
}

contract NestedBig {
  store: OuterBig;

  init() {
    self.store = OuterBig{
      inner: InnerLarge{ a:1,b:true,c:"test",d:42 },
      x: 9,
      y: false
    };
  }
}
