struct Compose {
  a: Int;
  b: String;
  c: Bool;
}

struct ComposeMany {
  x: Compose;
  y: Compose;
  z: Compose;
}

contract ComposeContract {
  store: ComposeMany;

  init() {
    self.store = ComposeMany{
      x: Compose{ a:1, b:"one", c:true },
      y: Compose{ a:2, b:"two", c:false },
      z: Compose{ a:3, b:"three", c:true }
    };
  }
}