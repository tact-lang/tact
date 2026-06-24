struct MultipleNestedOptionals {
  n1: Int?;
  n2: String?;
  n3: InnerOptionalStruct?;
}

struct InnerOptionalStruct {
  opt: Bool?;
}

contract NestedOptExample {
  f: MultipleNestedOptionals;

  init() {
    self.f = MultipleNestedOptionals{ n1:null, n2:null, n3:null };
  }
}