struct DiverseTypes {
  i: Int;
  b: Bool;
  s: String;
  c: Cell;
  sl: Slice;
  oi: Int?;
  ob: Bool?;
  os: String?;
  oc: Cell?;
  osl: Slice?;
}

contract MixTest {
  data: DiverseTypes;

  init() {
    self.data = DiverseTypes{
        i: 1,
        b: true,
        s: "s",
        c: emptyCell(),
        sl: emptyCell().asSlice(),
        oi: null,
        ob: null,
        os: null,
        oc: null,
        osl: null
    };
  }
}