struct FewTypes {
  a: Int?;
  b: Int;
  c: Bool;
  d: String?
}

contract ComboOptionalRequired {
  f: FewTypes;

  init() {
    self.f=FewTypes{a:null,b:1,c:true,d:null};
  }
}