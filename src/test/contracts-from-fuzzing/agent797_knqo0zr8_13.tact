struct BoolStruct { b: Bool; }
struct IntStruct { i: Int; }
struct OptStruct { o: Int?; }

contract ManyStructs {
  f1: BoolStruct;
  f2: IntStruct;
  f3: OptStruct;

  init() {
    self.f1 = BoolStruct{b:true};
    self.f2 = IntStruct{i:42};
    self.f3 = OptStruct{o:null};
  }
}
