struct OptionStringHolder {
  val: String?;
}

contract OptStrStruct {
  has: OptionStringHolder;

  init() {
    self.has = OptionStringHolder{ val: null };
  }
}