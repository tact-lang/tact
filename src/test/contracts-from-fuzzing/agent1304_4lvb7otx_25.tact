message(3) M { foo: Int }

contract OptMessage {
  m: M?;

  init() {
    self.m = null;
  }
}