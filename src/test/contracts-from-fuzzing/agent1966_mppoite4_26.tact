struct ChildField {
  f: Int;
}

struct ParentField {
  sub: ChildField;
}

contract NullableSubStruct {
  f: ParentField?;

  init() {
    self.f = ParentField{
      sub: ChildField{f: 42}
    };
  }
}
