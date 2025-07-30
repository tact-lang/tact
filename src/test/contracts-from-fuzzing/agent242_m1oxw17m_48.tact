struct MultiLayerDefaultOpt {
  a: Int?;
  b: Layer2?;
}

struct Layer2 {
  c: Bool?;
  d: Layer3?;
}

struct Layer3 {
  e: String?;
  f: Address?;
}

contract MultiLayerDefaults {
  f: MultiLayerDefaultOpt;

  init() {
    self.f = MultiLayerDefaultOpt{
      a: null,
      b: Layer2{
        c: null,
        d: Layer3{
          e: null,
          f: null,
        },
      },
    };
  }
}