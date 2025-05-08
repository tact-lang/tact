struct Stuff {
  a: Int;
  b: Bool;
}

struct OtherStuff {
  foo: Stuff;
  bar: Stuff;
  s1: String;
  s2: String?;
}

contract ComboStorage {
  data: OtherStuff;

  init() {
    self.data = OtherStuff{
      foo: Stuff{ a: 1, b: true },
      bar: Stuff{ a: 2, b: false },
      s1: "xx",
      s2: null
    };
  }
}