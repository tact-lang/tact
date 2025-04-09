// Struct with lots of fields, some optional, some with defaults, nested
struct ManyFields {
  x1: Int = 1;
  x2: Int? = null;
  x3: Bool = true;
  x4: Bool? = null;
  x5: String = "abc";
  x6: String? = null;
  x7: Int = 7;
  x8: Int? = null;
}

contract MegaContract {
  field: ManyFields = ManyFields{};
  init() {
    self.field = ManyFields{
      x1: 11,
      x2: 22,
      x3: false,
      x4: true,
      x5: "zzz",
      x6: "opt",
      x7: 77,
      x8: null
    };
  }
}
