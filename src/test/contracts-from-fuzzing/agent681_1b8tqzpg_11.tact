struct WideOpt {
  f1: Int?;
  f2: Bool?;
  f3: String?;
  f4: Int?;
  f5: Bool?;
  f6: String?;
}

contract ManyOptionals {
  data: WideOpt;

  init() {
    self.data = WideOpt{
      f1: null,
      f2: true,
      f3: null,
      f4: 7,
      f5: null,
      f6: "xx",
    };
  }
}