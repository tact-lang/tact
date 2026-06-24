struct RecvTest {
  text: String;
  flag: Bool;
}

contract XYZ {
  data: RecvTest;
  init() { self.data = RecvTest{ text: "aaa", flag: true }; }
  receive() {
    self.data = RecvTest{ text: "bbb", flag: false };
  }
}