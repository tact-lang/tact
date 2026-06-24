struct OptionalHaver {
  innerOptional: Inner?;
}

struct Inner {
  val: Int;
}

contract OptStructStorage {
  field: OptionalHaver;

  init() {
    self.field = OptionalHaver { innerOptional: null };
  }
}
