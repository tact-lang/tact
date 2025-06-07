struct RecA { sb: RecB; }
struct RecB { val: Int; }
contract Foo {
  obj: RecA;
  init() {
    self.obj = RecA{ sb: RecB{ val:1 } };
  }
}