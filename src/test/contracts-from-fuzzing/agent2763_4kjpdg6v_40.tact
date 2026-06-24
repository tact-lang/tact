struct A {
  x: Int;
  y: Bool;
}

struct B {
  inner: A;
  optInner: A?;
}

contract OptionalStructFields {
  val: B;
  init() {
    self.val = B{
      inner: A{x:1,y:true},
      optInner: null
    };
  }
}