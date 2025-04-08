struct MessageWrapper {
  code: Int;
  content: String;
}

contract ComplexInit {
  param1: Int;
  param2: MessageWrapper;
  flag: Bool;

  init() {
    self.param1 = 10;
    self.param2 = MessageWrapper{code:77, content:"payload"};
    self.flag = true;
  }
}