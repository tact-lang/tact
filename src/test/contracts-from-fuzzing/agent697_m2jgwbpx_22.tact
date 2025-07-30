struct Inner {
  foo: Int?;
  bar: Bool;
}

struct Outer {
  inn: Inner?;
  txt: String?;
}

contract Test {
  big1: Int = 1;
  big2: Int = 2;
  big3: Int = 3;
  big4: Int = 4;
  big5: Int = 5;

  data: Outer? = null;

  init() {
    self.big1 = 11;
    self.big2 = 12;
    self.big3 = 13;
    self.big4 = 14;
    self.big5 = 15;
    self.data = Outer{
      inn: Inner{ foo:42, bar:true },
      txt: "hello"
    };
  }

  receive() {}
}