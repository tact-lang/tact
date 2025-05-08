struct SmallNested {
  inn: Inner;
}

struct Inner {
  ok: Bool;
  str: String;
}

contract Test {
  sn: SmallNested;

  init() {
    self.sn = SmallNested{
      inn: Inner{ ok: true, str: "hi" }
    };
  }
}