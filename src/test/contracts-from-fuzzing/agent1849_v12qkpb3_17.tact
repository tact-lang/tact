struct DeepDefaultNest {
  inner: InnerDefault;
}

struct InnerDefault {
  innermost: InnerMostDefault;
}

struct InnerMostDefault {
  count: Int = 5;
}

contract DeepDefaultStructTest {
  val: DeepDefaultNest;

  init() {
    self.val = DeepDefaultNest{ inner: InnerDefault{ innermost: InnerMostDefault{} } };
  }
}