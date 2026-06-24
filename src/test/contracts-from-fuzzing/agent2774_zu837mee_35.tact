// nested with string optionals
struct Inner {
  s: String?;
}

contract TestContract {
  val: Inner?;

  init() {
    self.val = Inner{ s:null };
  }
}