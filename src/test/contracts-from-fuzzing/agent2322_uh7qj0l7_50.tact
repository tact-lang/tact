struct BoolOpt {
  val: Bool?;
}

struct NestedInnerOptional {
  inn: BoolOpt;
}

contract NestedOptStruct {
  val: NestedInnerOptional = NestedInnerOptional{
    inn: BoolOpt{ val: null }
  };

  init() {}
}
