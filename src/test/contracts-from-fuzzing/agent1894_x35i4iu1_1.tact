struct LargeStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String;
  g: Int;
  h: Bool;
  i: String;
  j: Int?;
}

contract LargeStructStorage {
  big: LargeStruct;
  init() {
    self.big = LargeStruct{
      a:1, b:true, c:"one", d:2, e:false, f:"two", g:3, h:true, i:"three", j:null
    };
  }
}
