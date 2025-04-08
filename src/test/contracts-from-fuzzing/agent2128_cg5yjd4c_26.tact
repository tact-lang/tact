struct HasDefaultNull {
  a: Int?; // implicit null default
}

contract OptionalDefaultAssign {
  field: HasDefaultNull;

  init() {
    self.field = HasDefaultNull{};
  }
}