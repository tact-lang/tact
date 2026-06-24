// nested optional struct with default as null, then overwrite
struct NestedStruct {
  a: Int;
}

contract OptionalStructWithDefault {
  gg: NestedStruct? = null;

  init() {
    self.gg = NestedStruct{ a:42 };
  }
}