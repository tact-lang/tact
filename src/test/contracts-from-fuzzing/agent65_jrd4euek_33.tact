struct OptionalWrap {
  layer: LayerInner?;
}

struct LayerInner {
  val1: Int;
  val2: Bool;
}

contract OptStructWrap {
  bigwrap: OptionalWrap;
  init() {
    self.bigwrap = OptionalWrap{ layer: null };
  }
}