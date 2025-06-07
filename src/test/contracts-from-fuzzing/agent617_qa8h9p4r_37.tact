struct NestedOptDefaults {
  a: Int?;
  b: Bool?;
}

struct Holder {
  item: NestedOptDefaults;
}

contract DeepOptDefault {
  val: Holder = Holder{ item: NestedOptDefaults{ a:null, b:null } };
  init() {
    self.val = Holder{ item: NestedOptDefaults{ a:null, b:null } };
  }
}