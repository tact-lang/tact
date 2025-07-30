struct HasOptional {
  n: Int?;
  b: Bool?;
  addr: Address?;
}

contract OptsInStruct {
  s: HasOptional;

  init() {
     self.s = HasOptional{
       n: null,
       b: null,
       addr: null
     };
  }
}