struct NestedOpt {
  a: Int?;
  b: Bool?;
  c: String?;
}

struct HasNested {
  n: NestedOpt;
}

contract HasNestedOpt {
  field: HasNested;

  init() {
    self.field = HasNested{ n: NestedOpt{ a:null,b:null,c:null } };
  }
}