struct InnerA {
  innerValue: Int;
  flag: Bool;
}

struct InnerB {
  s: String;
  ref: Cell;
}

struct Outer {
  caseA: InnerA;
  caseB: InnerB;
  comment: String?;
}

contract NestedStructsOptional {
  data: Outer;
  init() {
    self.data = Outer{
      caseA: InnerA{innerValue:10, flag:true},
      caseB: InnerB{s:"test", ref:emptyCell()},
      comment: null,
    };
  }
}