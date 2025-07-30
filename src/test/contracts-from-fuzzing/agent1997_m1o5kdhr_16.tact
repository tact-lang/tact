struct SubSer {
  x: Int as uint5;
  y: Int as int9;
}

struct ContainerSer {
  first: SubSer;
  optInt: Int?;
  flag: Bool;
}

contract MixedSerializations {
  inner: ContainerSer;

  init() {
    self.inner = ContainerSer{
      first: SubSer{ x: 10, y: -3 },
      optInt: null,
      flag: true
    };
  }
}
