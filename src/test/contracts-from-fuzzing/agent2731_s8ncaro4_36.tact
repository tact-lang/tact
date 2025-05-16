struct SubA {
  flag: Bool;
}

struct OuterA {
  field: SubA?;
}

contract OptNestedPrim {
  data: OuterA;

  init() {
    self.data = OuterA{field:null};
  }
}