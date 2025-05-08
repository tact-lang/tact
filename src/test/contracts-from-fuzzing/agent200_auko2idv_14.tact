struct OptionalDeep {
  inner: Mid?;
}

struct Mid {
  deep: InnerMost?;
}

struct InnerMost {
  val: Int;
}

contract OptNested {
  data: OptionalDeep;
  init() {
    self.data = OptionalDeep{
      inner: Mid{
        deep: null
      }
    };
  }
}