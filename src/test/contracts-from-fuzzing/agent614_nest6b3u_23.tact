struct Embedded {
  num: Int;
  txt: String?;
}

struct Container {
  id: Int;
  param: String;
  inner: Embedded?;
}

contract ComplexOpt {
  rec: Container?;

  init() {
    self.rec = Container{
      id: 7,
      param: "p",
      inner: Embedded{
        num: 10,
        txt: null
      }
    };
  }
}