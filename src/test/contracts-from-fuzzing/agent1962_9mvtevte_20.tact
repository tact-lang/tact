struct Foo { bar: Int; bar2: Int; bar3: Int; bar4: Int; bar5: Int; }

contract SamePrefix {
  f1: Foo;
  f2: Foo;

  init() {
    let foo = Foo{ bar: 1, bar2:2, bar3:3, bar4:4, bar5:5 };
    self.f1 = foo;
    self.f2 = foo;
  }
}