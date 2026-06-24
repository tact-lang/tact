struct HasOptionals {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract DefaultNulls {
  has: HasOptionals;

  init() {
    self.has = HasOptionals{
      x: null,
      y: null,
      z: null
    };
  }
}