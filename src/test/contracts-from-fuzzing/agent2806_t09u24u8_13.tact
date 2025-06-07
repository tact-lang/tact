struct OptionalInner {
  flag: Bool;
}

struct MaybeInner {
  inner: OptionalInner?;
  msg: String;
}

contract NullInner {
  value: MaybeInner;

  init() {
    self.value = MaybeInner{
      inner: null,
      msg: "hello"
    };
  }
}