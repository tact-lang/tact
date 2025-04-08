struct Data {
  a: Int;
  b: Int;
  c: Int;
}

contract SetAllInInit {
  data: Data;

  init() {
    self.data = Data{
      a: 2,
      b: 3,
      c: 4
    };
  }
}