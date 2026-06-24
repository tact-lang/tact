struct NestedOptional {
  x: Int?;
  y: Bool?;
  inner: Inner?;
}

struct Inner {
  z: Int?;
  msg: String?;
}

contract NestedOptionalContract {
  data: NestedOptional;

  init() {
    self.data = NestedOptional{
      x: null,
      y: null,
      inner: Inner{
        z: null,
        msg: null
      }
    };
  }
}