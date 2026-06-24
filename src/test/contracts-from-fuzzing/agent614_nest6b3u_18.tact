struct Data {
  a: Int;
  b: String?;
  c: Bool;
}

contract OptStructWithDefault {
  rec: Data? = null;

  init() {
    self.rec = Data{a:1,b:"hi",c:true};
  }
}