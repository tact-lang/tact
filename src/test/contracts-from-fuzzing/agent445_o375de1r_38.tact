// Initialize persistent optional with explicit nested struct
struct Inner {
  t: Int?;
}

contract OptAssign {
  data: Inner?;

  init() {
    self.data = Inner{
      t: 42
    };
  }
}
