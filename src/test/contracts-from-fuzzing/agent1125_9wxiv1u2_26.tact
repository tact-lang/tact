// Optional struct field with nested optional inside struct
struct Inner { x: Int? }
struct Outer {
  i: Int;
  nest: Inner?;
}

contract OptStructOpt {
  data: Outer;
  init() {
    self.data = Outer{ i: 5, nest: null };
  }
}