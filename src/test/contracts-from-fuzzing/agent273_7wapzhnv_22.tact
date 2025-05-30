// Deep optional in struct fields
struct InnerMost {
  message: String?;
}

struct Middle {
  inner: InnerMost?;
}

contract TestContract {
  mid: Middle;

  init() {
    self.mid = Middle{
      inner: null
    };
  }
}