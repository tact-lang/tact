struct BigNested {
  p: Int;
  q: String;
  r: Bool;
  s: Int?;
  t: String;
}

contract HeavyNested {
  x: Int;
  y: BigNested;
  z: Bool;

  init() {
    self.x = 7;
    self.y = BigNested{p: 1, q: "hello", r: false, s: null, t: "end"};
    self.z = true;
  }
}