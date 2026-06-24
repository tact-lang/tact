struct OptStruct {
  s: Int?;
}

struct Holder {
  field: OptStruct?;
}

contract OptStructTest {
  h: Holder;

  init() {
    self.h = Holder{field: null};
  }
}