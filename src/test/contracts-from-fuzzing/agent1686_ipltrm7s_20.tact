struct ComplexInner1 {
  x: Int;
  y: Bool;
  z: Address;
}

struct ComplexInner2 {
  p: String;
  q: Cell;
}

struct ComplexOuter {
  ci1: ComplexInner1;
  ci2: ComplexInner2;
  opt: Bool?;
}

contract ComplexNestedFields {
  data: ComplexOuter;

  init() {
    self.data = ComplexOuter{
      ci1: ComplexInner1{x:1,y:true,z:myAddress()},
      ci2: ComplexInner2{p:"p",q:emptyCell()},
      opt: null
    };
  }
}