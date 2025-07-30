struct OptionalInner {
  inn: Int?;
}

struct ContainerO {
  x: Int;
  y: OptionalInner?;
}

contract ContainerOptTest {
  s: ContainerO;

  init() {
    self.s = ContainerO{
      x: 7,
      y: OptionalInner{inn:null}
    };
  }
}