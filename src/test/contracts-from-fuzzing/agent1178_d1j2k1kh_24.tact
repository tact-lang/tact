struct Outmost {
  innermost: Int?;
}

contract Test {
  data: Outmost;
  init() {
    self.data = Outmost{innermost: null};
  }
}