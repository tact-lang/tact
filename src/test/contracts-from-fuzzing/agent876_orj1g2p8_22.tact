struct Inner {
  s: String;
  b: Bool;
  i: Int;
}

contract MultiTypeStructStorage {
  field: Inner;

  init() {
    self.field = Inner{
      s:"abc",
      b:true,
      i:42
    };
  }
}