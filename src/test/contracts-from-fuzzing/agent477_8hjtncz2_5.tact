struct SingleOptional {
  optVal: Int?;
}

contract OptionalFieldDefaults {
  single: SingleOptional;

  init() {
    self.single = SingleOptional{ optVal: null };
  }
}