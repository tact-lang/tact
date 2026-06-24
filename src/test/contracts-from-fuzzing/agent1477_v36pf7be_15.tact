struct LargeDeep {
  a: Int;
  b: Bool;
  c: String;
  d: Slice;
  e: Address;
  f: Int?;
  g: Bool?;
  h: String?;
  i: Slice?;
  j: Address?;
}

contract MixFields {
  st: LargeDeep;

  init() {
    self.st = LargeDeep{
      a:1, b:true, c:"x", d:emptyCell().asSlice(), e:myAddress(),
      f:null, g:null, h:null, i:null, j:null,
    };
  }
}