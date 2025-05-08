struct NestedNulls {
  field1: Int?;
  field2: String?;
}

contract ImplicitNullStruct {
  xx: NestedNulls;

  init() {
    self.xx = NestedNulls{};
  }
}
