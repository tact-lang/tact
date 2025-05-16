struct MaybeComposites {
  s: Slice?;
  c: Cell?;
  txt: String?;
}

contract OptionalPrimitives {
  misc: MaybeComposites;

  init() {
    self.misc = MaybeComposites{
      s: null,
      c: null,
      txt: null
    };
  }
}
