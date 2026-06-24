struct OnlyOptionals {
 x: Int?;
 y: Bool?;
 z: String?;
}

contract AllNulls {
  d: OnlyOptionals;

  init() {
    self.d = OnlyOptionals{};
  }
}