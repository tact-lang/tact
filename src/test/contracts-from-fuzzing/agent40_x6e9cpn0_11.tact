struct S {
  f1: Int as uint8;
  f2: Int as uint32;
  f3: Int as int64;
  f4: Int as coins;
  f5: Bool;
  f6: String;
}

contract Serialized {
  data: S;
  init() {
    self.data = S{
      f1: 1, f2: 2, f3: 3, f4: 4, f5: true, f6: "test"
    };
  }
}