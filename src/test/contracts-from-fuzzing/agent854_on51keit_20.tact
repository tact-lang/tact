struct HasString {
  s: String;
}

struct WrapOptional {
  innerOpt: HasString?;
}

contract NestedOptString {
  val: WrapOptional;

  init() {
    self.val = WrapOptional{ innerOpt: null };
  }
}