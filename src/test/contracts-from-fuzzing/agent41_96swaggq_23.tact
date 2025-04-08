struct Reordered {
  a: Bool;
  b: Int;
  c: String;
}

contract OrderTest {
  f: Reordered;

  init() {
    self.f = Reordered{
      a:false,
      b:123,
      c:"hello"
    };
  }
}
