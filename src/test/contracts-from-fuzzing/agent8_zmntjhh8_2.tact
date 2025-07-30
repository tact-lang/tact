struct DeeplyNested {
  x: Int;
  y: String?;
}

struct MidLevel {
  a: DeeplyNested;
  b: Bool;
  c: String;
}

contract MultiLayerFields {
  middle: MidLevel;

  init() {
    self.middle = MidLevel{
      a: DeeplyNested{
        x: 777,
        y: null,
      },
      b: false,
      c: "hi",
    };
  }
}