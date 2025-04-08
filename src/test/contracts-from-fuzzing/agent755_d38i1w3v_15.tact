struct Root {
  a: Int;
  b: Int?;
}

contract OptFieldOrder {
  data: Root;

  init() {
    self.data = Root{a:1,b:null};
  }
}