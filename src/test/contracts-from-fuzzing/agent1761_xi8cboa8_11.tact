struct BoolNest {
  inner: BoolNest2;
}

struct BoolNest2 {
  inner: BoolNest3;
}

struct BoolNest3 {
  flag: Bool;
}

contract BoolNestTest {
  data: BoolNest;

  init() {
    self.data = BoolNest{
      inner: BoolNest2{
        inner: BoolNest3{ flag: true }
      }
    };
  }
}