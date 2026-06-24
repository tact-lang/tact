// Contract field is struct containing multiple optionals
struct Inner {
  a: Int?;
  b: String?;
}

contract TestContract {
  data: Inner;

  init() {
    self.data = Inner{ a: null, b: "hi" };
  }
}