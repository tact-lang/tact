// struct with partially defaulted fields and explicit init
struct MixedDef {
  a: Int;           // required
  b: Bool = false;  // defaulted
  c: String = "";  // defaulted
  d: Int?;          // optional, default null
}

contract TestContract {
  field: MixedDef;

  init() {
    self.field = MixedDef{
      a: 11,
      d: null
    };
  }
}