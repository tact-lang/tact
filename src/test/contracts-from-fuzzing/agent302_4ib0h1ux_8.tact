struct Wrap {
  nested: Wrap2;
}

struct Wrap2 {
  nested2: Wrap3;
}

struct Wrap3 {
  val: Int;
}

contract MultiLevel {
  w: Wrap;

  init() {
    self.w = Wrap{
      nested: Wrap2{
        nested2: Wrap3{
          val: 404
        }
      }
    };
  }
}
