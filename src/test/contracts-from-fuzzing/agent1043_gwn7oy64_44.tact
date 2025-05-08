// Optionals with nested default struct
struct InnerDefault {
  x: Int = 1;
}

struct Holder {
  inner: InnerDefault?;
}

contract TestContract {
  holder: Holder;

  init() {
    self.holder = Holder{ inner: null };
  }
}