// struct with only optionals, later nested
struct Inner {
  x: Int?;
  y: Bool?;
}

struct Outer {
  inner: Inner;
}

contract TestContract {
  val: Outer;

  init() {
    self.val = Outer{
      inner: Inner{
        x: null,
        y: null
      }
    };
  }
}