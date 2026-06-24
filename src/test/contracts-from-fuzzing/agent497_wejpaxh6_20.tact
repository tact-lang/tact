struct SomeData {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract TestContract {
  d1: SomeData?;
  d2: SomeData;

  init() {
    self.d1 = null;
    self.d2 = SomeData{a:null, b:true, c:"q"};
  }
}