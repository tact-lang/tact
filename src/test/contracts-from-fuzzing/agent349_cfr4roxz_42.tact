// Compose struct with optional nested struct, opt default null
struct Inner {
  x: Int;
}

struct Wrap {
  i: Inner? = null;
  s: String;
}

contract DefOptNested {
  val: Wrap;
  init() {
    self.val = Wrap{ s: "sss" };
  }
}