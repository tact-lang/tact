struct LayerA { i: Int }
struct LayerB { a: LayerA }
struct LayerC { b: LayerB }
struct LayerD { c: LayerC }

struct WrapAll {
  v: LayerD;
  opt: Int?;
}

contract DeepWrapper {
  s: WrapAll;

  init() {
    self.s = WrapAll{
      v: LayerD{ c: LayerC{ b: LayerB{ a: LayerA{ i: 101 } } } },
      opt: null
    };
  }
}