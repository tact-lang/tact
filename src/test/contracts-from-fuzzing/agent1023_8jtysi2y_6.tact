struct DeepOption {
  n: Int?; s: String?; b: Bool?
}

struct Wrap {
  wrapped: DeepOption
}

contract OptWrap {
  store: Wrap;
  
  init() {
    self.store = Wrap{
      wrapped: DeepOption {
        n: 100,
        s: null,
        b: true
      }
    };
  }
}
