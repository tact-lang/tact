struct NestOpt {
  a: Int?;
  b: Bool?;
}

struct HasNestOpt {
  inner: NestOpt?;
}

contract OptOpt {
  data: HasNestOpt;
  init() {
    self.data = HasNestOpt{ inner: null };
  }
}