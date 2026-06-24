struct BoolVariants {
  a: Bool;
  b: Bool?;
}

contract BoolVariantsContract {
  data: BoolVariants;

  init() {
    self.data = BoolVariants{
      a: true,
      b: false
    };
  }
}