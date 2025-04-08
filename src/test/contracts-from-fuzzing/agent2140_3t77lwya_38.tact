// optional struct with nested optional struct, many levels
struct D { z: Int; }
struct C { d: D?; }
struct B { c: C?; }
struct A { b: B?; }

contract DeepOptMany {
  data: A?;
  init() {
    self.data = null;
  }
}
