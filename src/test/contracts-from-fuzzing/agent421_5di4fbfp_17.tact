struct MixTypes {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Int?;
  f: Bool?;
  g: String?;
  h: Address?;
}

contract MixedFields {
  m: MixTypes;

  init() {
    self.m = MixTypes{
      a:1, b:true, c:"s", d:myAddress(), e:null, f:null, g:null, h:null
    };
  }
}