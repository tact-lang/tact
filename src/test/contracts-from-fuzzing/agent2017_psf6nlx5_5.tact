struct TinyOption {
  flag: Bool?;
}

contract SmallOptional {
  data: TinyOption;

  init() {
    self.data = TinyOption{ flag: null };
  }
}
