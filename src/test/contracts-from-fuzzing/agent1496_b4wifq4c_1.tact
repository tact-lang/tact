struct InnerStruct {
  a: Int;
  b: Bool;
  c: Cell;
}

contract TestContract {
  s1: InnerStruct;
  s2: InnerStruct;

  init() {
    self.s1 = InnerStruct{a:1, b:true, c:emptyCell()};
    self.s2 = InnerStruct{a:2, b:false, c:emptyCell()};
  }
}