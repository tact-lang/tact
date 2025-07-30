struct Inner {
  flag: Bool;
  count: Int;
}

contract OptionalOfStruct {
  data: Inner?;

  init() {
    self.data = Inner{
      flag: true,
      count: 2
    };
  }
}