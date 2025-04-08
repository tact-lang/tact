struct SubOpt {
  ai: Int?;
  ab: Bool?;
}

struct Container {
  sub: SubOpt;
  val: Int;
}

contract PartialOptInit {
  c: Container;
  init() {
    self.c = Container{
      sub: SubOpt{ ai: null, ab: null },
      val: 5
    };
  }
}