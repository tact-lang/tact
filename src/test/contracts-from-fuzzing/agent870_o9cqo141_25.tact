struct ManyNestedOptionals {
  aa: Int?;
  bb: Bool?;
  cc: Int?;
  dd: Bool?;
}

struct ContainsNestedOptional {
  innerOpt: ManyNestedOptionals?;
}

contract FondOfNulls {
  val: ContainsNestedOptional;

  init() {
    self.val = ContainsNestedOptional{ innerOpt: null };
  }
}