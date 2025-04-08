struct MultiNestedOpt {
  nest1: Int?;
  nest2: String?;
  nest3: Bool?;
}

contract NestedNulls {
  field: MultiNestedOpt?;

  init() {
    self.field = null;
  }
}
