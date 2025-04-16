struct Mix {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: String;
  f: String?;
  g: Address;
  h: Address?;
}

contract MixTypesTest {
  m: Mix;

  init() {
    self.m = Mix{
      a:1, b:false, c:null, d:null, e:"", f:null, g:myAddress(), h:null
    };
  }
}
