struct Child {
  val: Int;
}

struct ParentOpt {
  child: Child?;
}

contract OptNestedStruct {
  data: ParentOpt;
  init() {
    self.data = ParentOpt{ child: null };
  }
}