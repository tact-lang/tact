struct Wrap {
  nested: NestedOpt;
}

struct NestedOpt {
  inner: InnerN?;
}

struct InnerN {
  deep: Int;
}

contract OptionalWrap {
  val: Wrap;

  init() {
    self.val = Wrap{
      nested: NestedOpt{
        inner: InnerN{ deep: 5 }
      }
    };
  }
}