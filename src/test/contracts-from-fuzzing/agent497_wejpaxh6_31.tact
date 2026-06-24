struct DeepDefaults {
  s1: L1;
}
struct L1 {
  s2: L2;
  x: Int;
}
struct L2 {
  s3: L3;
}
struct L3 {
  y: Int = 42;
}

contract TestContract {
  val: DeepDefaults;

  init() {
    self.val = DeepDefaults{
      s1: L1{
        x: 7,
        s2: L2{ s3: L3{} }
      }
    };
  }
}