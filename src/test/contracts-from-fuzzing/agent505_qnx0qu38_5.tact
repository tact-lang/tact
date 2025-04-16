struct S {
  a: Int;
  b: String;
  c: Bool;
  d: String;
  e: Int;
  f: Bool?;
  g: String;
  h: Int;
}

contract BigStruct {
  val: S = S{
    a:1, b:"b", c:true, d:"d", e:5, f:null, g:"g", h:8
  };

  init() {
    self.val = self.val;
  }

  receive() {
    self.val = self.val;
  }
}