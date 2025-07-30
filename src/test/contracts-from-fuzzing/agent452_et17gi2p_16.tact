struct SubDefault {
  flag: Bool = true;
}

struct OuterDefault {
  sub: SubDefault;
  count: Int = 5;
}

contract DefaultStructs {
  data: OuterDefault;

  init() {
    self.data = OuterDefault{
      sub: SubDefault{},
      count: 10,
    };
  }
}