struct ManyOptionals {
  x: Int?;
  y: Bool?;
  z: Address?;
  s: String?;
}

contract TestOpt {
  data: ManyOptionals;

  init() {
    self.data = ManyOptionals{
      x: null,
      y: true,
      z: null,
      s: "hello"
    };
  }
}
