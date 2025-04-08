struct OptStruct {
  s: Int?;
}

contract TestContract {
  arr: OptStruct;

  init() {
    self.arr = OptStruct{ s: null };
  }
}