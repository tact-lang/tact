struct MultilvlOpt {
  a: Int?;
  b: Bool?;
  c: String?;
}
struct OuterMultilvl {
  foo: MultilvlOpt?;
}
contract MultiOptional {
  data: OuterMultilvl;
  init() {
    self.data = OuterMultilvl{ foo: null };
  }
}