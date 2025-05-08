message(100) Msg1 {
  info: String?;
}

message(200) Msg2 {
  num: Int;
  nested: Msg1?;
}

contract MessageInStorage {
  m: Msg2?;

  init() {
    self.m = Msg2{
      num: 77,
      nested: Msg1{ info: null }
    };
  }
}