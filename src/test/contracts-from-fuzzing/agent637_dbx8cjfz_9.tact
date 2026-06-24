struct OptString {
  s: String?;
}

contract TestContract {
  val: OptString;

  init() {
    self.val = OptString{
      s: null
    };
  }
}