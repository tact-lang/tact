struct Embed {
  i: Int;
  b: Bool;
}

contract TestContract {
  e1: Embed;
  e2: Embed;

  init() {
    self.e1 = Embed{i:1,b:true};
    self.e2 = Embed{i:2,b:false};
  }
}