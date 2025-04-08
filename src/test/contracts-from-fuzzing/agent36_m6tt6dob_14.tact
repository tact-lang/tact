struct ManyOptionals {
  a: Int?; b: Bool?; c: Cell?;
  d: Slice?; e: Builder?; f: Address?;
  g: String?; h: Int?;
}

contract CManyOptionals {
  s: ManyOptionals;
  init() {
    self.s = ManyOptionals{
      a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
    };
  }
}