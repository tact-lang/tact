struct MixedDeep {
  lvl1: LayerA;
}
struct LayerA {
  lvl2: LayerB;
}
struct LayerB {
  x: Int;
  flag: Bool?;
}

contract MixLayers {
  mixed: MixedDeep;

  init() {
    self.mixed = MixedDeep{ lvl1: LayerA{ lvl2: LayerB{ x: 12, flag: null} } };
  }
}