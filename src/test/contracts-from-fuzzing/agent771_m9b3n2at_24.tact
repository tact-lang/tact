struct HasBool {
    flag: Bool;
}

contract OptionalStructBool {
    val: HasBool?;

    init() {
      self.val = null;
    }
}