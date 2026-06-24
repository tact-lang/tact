struct DeepOpt {
  inner: Inner?;
}

struct Inner {
  val: Int?;
  flag: Bool?;
}

contract InOptLayers {
  deep: DeepOpt;

  init() {
    self.deep = DeepOpt{ inner: null };
  }
}
