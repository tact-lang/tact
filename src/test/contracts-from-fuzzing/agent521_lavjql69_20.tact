// deeply nested optional struct fields with defaults
struct Innermost {
  a: Int? = null;
}

struct Inner {
  nest: Innermost? = null;
}

struct Outer {
  data: Inner? = null;
}

contract DeepDefaultsContract {
  storage: Outer;

  init() {
    self.storage = Outer{};
  }
}