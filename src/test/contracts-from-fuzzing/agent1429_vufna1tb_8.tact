struct Inner1 { x: Int; }
struct Inner2 { y: Bool; }
struct Inner3 { z: String; }

struct Outer {
  a: Inner1;
  b: Inner2;
  c: Inner3;
}

contract MultiNested {
  value: Outer;

  init() {
    self.value = Outer{
      a: Inner1{ x: 1 },
      b: Inner2{ y: true },
      c: Inner3{ z: "ok" }
    };
  }
}
