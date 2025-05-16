struct InnerMost {
  score: Int = 0;
  verified: Bool = false;
}

struct Wrapper {
  nested: InnerMost?;
}

contract DeepDefaults {
  data: Wrapper;

  init() {
    self.data = Wrapper{
      nested: null
    };
  }
}
