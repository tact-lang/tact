const GLOBAL_CONST: Int = 11 + 22;

struct StructWithGlobalDefault {
  a: Int = GLOBAL_CONST;
}

contract ConstInStructField {
  s: StructWithGlobalDefault;

  init() {
    self.s = StructWithGlobalDefault{};
  }
}