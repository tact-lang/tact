struct MixSerialize {
  x: Int as int64;
  y: Bool;
  z: String;
}

contract SerializeMix {
  f: MixSerialize;

  init() {
    self.f = MixSerialize{ x: 1, y: true, z: "hi" };
  }
}
