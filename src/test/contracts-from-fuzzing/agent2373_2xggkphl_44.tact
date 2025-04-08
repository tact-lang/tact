struct DefaultAndOptionalStr {
  text: String = "def";
  maybe: String?;
}

contract DefaultsAndOptionals {
  data: DefaultAndOptionalStr;
  init() {
    self.data = DefaultAndOptionalStr{ maybe: null };
  }
}