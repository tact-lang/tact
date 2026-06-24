struct Inner {
  a: Int;
  b: Bool;
  c: String;
}

contract Test1 {
  point: Inner;   
  init() {
    self.point = Inner{
      a: 1,
      b: true,
      c: "hi"
    };
  }
}