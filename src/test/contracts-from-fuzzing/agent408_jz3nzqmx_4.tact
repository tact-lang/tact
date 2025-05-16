struct Data {
  f1: Int;
  f2: Bool;
  f3: Int?;
  f4: Bool?;
  f5: String;
  f6: String?;
}

contract Opts {
  data: Data;

  init() {
    self.data = Data {
      f1: 12,
      f2: true,
      f3: null,
      f4: null,
      f5: "hi",
      f6: null
    };
  }
}