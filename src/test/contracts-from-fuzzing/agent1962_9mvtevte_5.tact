// Optional nested struct inside optional outer one

struct InnerOpt {
  x: Int;
}

struct OuterOpt {
  inner: InnerOpt?;
}

contract OptStorage {
  data: OuterOpt?;

  init() {
    self.data = OuterOpt{ inner: InnerOpt{ x:1 } };
  }
}
