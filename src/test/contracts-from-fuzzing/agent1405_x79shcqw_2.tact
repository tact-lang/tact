struct NestedOptional {
  value: Int?;
  flag: Bool;
}

contract OptContract {
  data: NestedOptional;

  init() {
    self.data = NestedOptional{ value: null, flag: false };
  }

  receive() {
    let _ = self.data;
  }
}