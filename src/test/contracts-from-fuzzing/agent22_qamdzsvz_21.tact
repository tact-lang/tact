struct ComboStruct {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: Address;
  f: Address?;
}

contract TestComboStruct {
  data: ComboStruct;

  init() {
    self.data = ComboStruct{
      a:1, b:null, c:true, d:null, e:myAddress(), f:null
    };
  }
}