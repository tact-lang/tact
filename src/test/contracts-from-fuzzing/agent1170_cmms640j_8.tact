struct OptionalInner {
  name: String?;
  flag: Bool?;
  addr: Address?;
}

struct Container {
  i: Int;
  inner: OptionalInner;
}

contract OptionalDeep {
  data: Container;
  init() {
    self.data = Container{
      i: 0,
      inner: OptionalInner{
        name: null,
        flag: null,
        addr: null,
      }
    };
  }
}
