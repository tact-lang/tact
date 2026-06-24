// nested combination of optional struct, where optional holds a struct with optional
struct Inside {
  a: Int?;
}

struct TopLevel {
  nested: Inside?;
}

contract ComboOpt {
  top: TopLevel?;

  init() {
    self.top = TopLevel{ nested: Inside{ a:null } };
  }
}
