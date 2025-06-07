// test overlapping struct: struct inside struct that has defaulted optional fields
struct InnerOptDef {
  val: Int?;
  flag: Bool = false;
}

struct OuterOptDef {
  inner: InnerOptDef?;
  amount: Int = 11;
}

contract NestOptDef {
  store: OuterOptDef;

  init() {
    self.store = OuterOptDef{};
  }
}
