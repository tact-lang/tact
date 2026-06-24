struct SingleOptional {
  maybeStr: String?;
}

contract OptionalStructField {
  data: SingleOptional;

  init() {
    self.data = SingleOptional{
      maybeStr: null
    };
  }
}
