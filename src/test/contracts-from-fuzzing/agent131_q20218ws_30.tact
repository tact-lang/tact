struct Inner1 {
  x: Int;
}

struct Inner2 {
  y: Bool;
}

struct Outer {
  one: Inner1;
  two: Inner2;
}

contract NestedMulti {
  data: Outer;

  init() {
    self.data = Outer{
      one: Inner1{ x:1 },
      two: Inner2{ y:true }
    };
  }
}