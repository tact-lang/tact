struct AllowedOption {
  field: Int?;
}

contract TestOptField {
  data: AllowedOption;

  init() {
    self.data = AllowedOption{ field: null };
  }
}