struct EmptyOption {
  s: String?;
}

contract OptDefault {
  field: EmptyOption;

  init() {
    self.field = EmptyOption{
      s: null
    };
  }
}