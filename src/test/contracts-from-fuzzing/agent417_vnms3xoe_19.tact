struct Foo { val: Int; }

contract Rearranged {
  f1: Foo;
  num: Int;
  f2: Foo;
  flag: Bool;
  f3: Foo;

  init() {
    self.f1 = Foo{ val:1 };
    self.num = 5;
    self.f2 = Foo{ val:2 };
    self.flag = true;
    self.f3 = Foo{ val:3 };
  }
}