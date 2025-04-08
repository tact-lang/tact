// test nested optionals inside a struct: Int? inside a containing optional struct
struct Inner {
  v: Int?; 
}

contract TestContract {
  s: Inner?;

  init() {
    self.s = Inner{ v: null };
  }
}