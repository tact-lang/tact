struct Compose {
  f1: Int;
  f2: Bool;
  f3: String;
}

contract ComposeFields {
  c1: Compose;
  c2: Compose;

  init() {
    self.c1 = Compose{f1:1, f2:false, f3:"a"};
    self.c2 = Compose{f1:2, f2:true, f3:"b"};
  }
}