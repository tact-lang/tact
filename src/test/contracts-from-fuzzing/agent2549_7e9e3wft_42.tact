struct EmptyStrTest {
  val: String; 
}

contract EmptyStrs {
  s: EmptyStrTest;

  init() {
    self.s = EmptyStrTest{ val: "" };
  }
}