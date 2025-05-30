struct StrNest {
  a: String;
  b: String?;
}

contract StringStructPersist {
  data: StrNest;

  init() {
    self.data = StrNest{
      a: "foo",
      b: null
    };
  }
}