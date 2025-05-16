struct StringAndBool {
  s: String;
  b: Bool;
}

struct Holder {
  inner: StringAndBool;
  flag: Bool;
}

contract TestContract {
  data: Holder;
  init() {
    self.data = Holder{
      inner: StringAndBool{ s: "hi", b: true },
      flag: false
    };
  }
}