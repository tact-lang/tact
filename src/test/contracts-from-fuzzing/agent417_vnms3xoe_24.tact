struct Volatile {
  val1: Int;
  val2: Bool;
  val3: String;
}

contract ChangeState {
  state: Volatile;

  init() {
    self.state = Volatile{ val1:1, val2:true, val3:"first" };
  }

  receive() {
    self.state = Volatile{ val1:2, val2:false, val3:"second" };
  }
}