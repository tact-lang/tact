struct BoolNest {
  inner: Inner;
}

struct Inner {
  flag: Bool;
}

contract BoolTest {
  val: BoolNest;

  init() {
    self.val = BoolNest{
      inner: Inner{
        flag: true
      }
    };
  }
}