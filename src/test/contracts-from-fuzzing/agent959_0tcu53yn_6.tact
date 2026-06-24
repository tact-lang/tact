struct Inner {
  x: Int;
}

struct WithInner {
  a: Int;
  b: Inner;
}

contract ReplaceFields {
  rec: WithInner;

  init() {
    self.rec = WithInner{a:1, b:Inner{x:42}};
    self.rec = WithInner{a:2, b:Inner{x:100}};
  }
}