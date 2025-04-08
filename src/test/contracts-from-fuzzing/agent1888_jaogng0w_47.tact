message(1) Foo { data: Int; }

contract MsgOptional {
  m: Foo?;

  init() {
    self.m = null;
  }
}
