struct BigOptionals {
 a: Int?;
 b: Bool?;
 c: String?;
 d: Int?;
 e: Bool?;
 f: String?;
 g: Int?;
 h: Bool?;
 i: String?;
 j: Int?;
}

contract LotsOptionalStruct {
  big: BigOptionals;

  init() {
    self.big = BigOptionals{
      a:null, b:null, c:null, d:null, e:null,
      f:null, g:null, h:null, i:null, j:null
    };
  }
}