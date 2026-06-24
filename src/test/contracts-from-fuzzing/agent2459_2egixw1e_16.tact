// optional struct with optional field, nested
struct Inner {
  val: Int?;
}

contract TestContract {
  data: Inner?;

  init() {
    self.data = null;
  }
}