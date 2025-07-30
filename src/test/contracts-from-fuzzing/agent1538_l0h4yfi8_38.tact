struct Inner { x: Int }

struct HasInner {
  inn: Inner;
  opt: Inner?;
}

contract Test {
  storage: HasInner;

  init() {
    self.storage = HasInner{
      inn: Inner{ x:1 },
      opt: Inner{ x:2 }
    };
  }
}