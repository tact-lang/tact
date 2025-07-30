struct Fields {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
}

contract ComboOptPersist {
  k: Fields;
  init() {
    self.k = Fields{a:1,b:false,c:null,d:true};
  }
}