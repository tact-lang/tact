struct OptionalsNested {
  maybeInner: Inner?;
}

struct Inner {
  maybeNumber: Int?;
  maybeFlag: Bool?;
}

contract TestContract {
  data: OptionalsNested;

  init() {
    self.data = OptionalsNested{
      maybeInner: Inner{
        maybeNumber: 123,
        maybeFlag: false,
      },
    };
  }
}
