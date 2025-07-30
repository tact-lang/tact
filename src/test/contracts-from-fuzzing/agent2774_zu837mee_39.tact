// test optional slice inside nested struct with explicit serialization tag on inner
struct Inner {
  tail: Slice as remaining;
}

struct Outer {
  data: Inner?;
}

contract TestContract {
  val: Outer;

  init() {
    self.val = Outer{ data:null };
  }
}