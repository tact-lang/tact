struct MostlyOptionals {
 a: Int?; b: Bool?; c: String?; d: Cell?;
 e: Int?; f: Bool?; g: String?; h: Cell?;
}

contract OptStructFields {
  x: MostlyOptionals;
  init() {
    self.x = MostlyOptionals{
      a:null,b:null,c:null,d:null,
      e:null,f:null,g:null,h:null
    };
  }
}