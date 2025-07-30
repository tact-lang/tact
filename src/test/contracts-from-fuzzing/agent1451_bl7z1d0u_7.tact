struct NestOpt {
  v: Int;
  o: Inner?;
}

struct Inner {
  z: Bool;
}

contract FuzzOptNest {
  val: NestOpt;

  init() {
    self.val = NestOpt{
      v: 1,
      o: null
    };
  }
}
