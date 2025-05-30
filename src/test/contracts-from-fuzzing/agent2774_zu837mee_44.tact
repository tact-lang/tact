// deeply nested optional string in struct
struct Inner {
  msg: String?;
}

struct Outer {
  wrapped: Inner?;
}

contract TestContract {
  val: Outer;

  init() {
    self.val = Outer{
      wrapped: Inner{ msg: null }
    };
  }
}