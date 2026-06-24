struct ComposeInner {
  flag: Bool;
  text: String;
}

contract ComposeWithPrims {
  inner: ComposeInner;
  count: Int;
  label: String;

  init() {
    self.inner = ComposeInner{flag:true,text:"ok"};
    self.count = 7;
    self.label = "hi";
  }
}