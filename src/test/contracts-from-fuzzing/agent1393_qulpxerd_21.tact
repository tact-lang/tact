// multiple nested structs with defaults
struct S2 {
  x: Int = 5;
  y: Bool = false;
}

struct S1 {
  s2: S2;
  msg: String = "default";
}

contract DefaultsNested {
  data: S1;

  init() {
    self.data = S1{
      s2: S2{},
    };
  }
}
