struct OptInt {
  val: Int?;
}

contract RedundantInit {
  data: OptInt;

  init() {
    self.data = OptInt{ val: null };
  }
}