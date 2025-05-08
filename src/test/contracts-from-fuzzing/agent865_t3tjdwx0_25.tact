// Message-typed persistent storage
message(55) M1 {
  a: Int;
  s: String;
}

contract MsgFieldContract {
  data: M1;

  init() {
    self.data = M1{
      a: 42,
      s: "hello"
    };
  }
}
