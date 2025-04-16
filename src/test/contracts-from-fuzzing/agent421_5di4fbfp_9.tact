struct OptNestInner { val: Int?; }

struct OptNestOuter { inner: OptNestInner?; }

contract OptNestTest {
  data: OptNestOuter;

  init() {
    self.data = OptNestOuter{
      inner: OptNestInner{ val: 42 }
    };
  }
}