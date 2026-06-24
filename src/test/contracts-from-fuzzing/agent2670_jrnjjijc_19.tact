struct ContainerX {
  a: Int;
  b: InnerX;
}

struct InnerX {
  x: Int;
  y: Bool;
  z: OptionalDeep?;
}

struct OptionalDeep {
  q: Int;
  flag: Bool;
}

contract NestedOpt {
  val: ContainerX;

  init() {
    self.val = ContainerX{
      a: 10,
      b: InnerX{
        x: 5,
        y: true,
        z: null
      }
    };
  }
}