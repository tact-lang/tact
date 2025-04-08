struct Outer {
  inner1: Inner1;
  inner2: Inner2;
}
struct Inner1 {
  a: Int;
  b: Bool?;
}
struct Inner2 {
  x: String;
  y: Bool;
}

contract NestedMulti {
  val: Outer;

  init() {
    self.val = Outer{
      inner1: Inner1{
        a: 5,
        b: null
      },
      inner2: Inner2{
        x: "ok",
        y: true
      }
    };
  }
}
