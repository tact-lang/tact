struct Nested {
  v: Int = 10;
}

struct OptionNest {
  inner: Nested?;
  flag: Bool = false;
}

contract OptionalStructField {
  data: OptionNest;

  init() {
    self.data = OptionNest{ inner: null, flag: true };
  }

  receive() { dump(self.data.flag); }
}
