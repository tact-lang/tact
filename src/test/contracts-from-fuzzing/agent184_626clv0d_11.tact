struct Middle {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: String;
  f: Int?;
}

struct Master {
  inner: Middle;
  flag: Bool;
  note: String = "ok";
}

contract NestedMany {
  data: Master;

  init() {
    self.data = Master{
      inner: Middle{ a: 1, b: false, c: null, d: true, e: "zzz", f: null },
      flag: true
    };
  }
}
