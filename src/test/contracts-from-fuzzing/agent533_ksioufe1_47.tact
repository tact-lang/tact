struct SInner { x: Int; }

contract OptSimple {
  data: SInner?;

  init() {
    self.data = null;
  }
}