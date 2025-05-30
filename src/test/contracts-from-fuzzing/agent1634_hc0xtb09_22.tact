// Large struct with mixed primitives and nested structures
struct Inner1 {
  x: Int;
  y: Bool;
}

struct Inner2 {
  text: String;
  flag: Bool?;
}

struct Container {
  a: Inner1;
  b: Inner2;
  c: Int?;
  d: String;
}

contract TestContract {
  cont: Container;

  init() {
    self.cont = Container{
      a: Inner1{
        x: 10,
        y: true
      },
      b: Inner2{
        text: "abc",
        flag: null
      },
      c: null,
      d: "zzz"
    };
  }
}