struct ManyOptional {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: String?;
}

contract ComboOptionals {
  val: ManyOptional;

  init() {
    self.val = ManyOptional{a:null,b:null,c:null,d:null};
  }
}