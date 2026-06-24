struct OptionalInner {
  val: Int?;
  text: String?;
}

contract TestContract {
  data: OptionalInner;

  init() {
    self.data = OptionalInner{ val: null, text: null };
  }
}