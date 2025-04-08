struct NestedOpt {
  inner: String?;
  deeper: InnerOpt?;
}

struct InnerOpt {
  val: Int?;
}

struct MaybeStuff {
  s: NestedOpt?;
}

contract ComplicateOpts {
  root: MaybeStuff;

  init() {
    self.root = MaybeStuff{ s: null };
  }
}