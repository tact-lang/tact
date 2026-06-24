struct S1 {
  x: Int; 
}

struct S2 {
  s1: S1;
}

contract OptionalStructHolder {
  data: S2?;

  init() {
    self.data = null;
  }
}
