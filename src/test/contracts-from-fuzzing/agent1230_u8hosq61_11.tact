struct Mega {
  a: Int = 1;
  b: Int = 2;
  c: Bool = false;
  d: String = "x";
  e: Bool = true;
  f: String = "y";
  g: Int?;
  h: Bool?;
  i: Inner;
}

struct Inner {
  z: Int?;
}

contract ManyFields {
  data: Mega;

  init() {
    self.data = Mega{ i: Inner{} };
  }
}