struct Inner {
  flag: Bool;
  txt: String?;
}

contract OptNested {
  field: Inner?;

  init() {
    self.field = Inner{
      flag: true,
      txt: "yes"
    };
  }
}