struct DeepOptS {
  info: Info?;
}

struct Info {
  message: String?;
  flag: Bool?;
}

contract VeryOption {
  d: DeepOptS;

  init() {
    self.d = DeepOptS{
      info: Info{ message: null, flag: true }
    };
  }
}