struct Multi {
  a: Int;
  b: Bool;
  c: String?;
  d: Cell?;
  e: Address?;
}

contract MultiPersist {
  f1: Multi;
  f2: Multi;
  f3: Multi;

  init() {
    self.f1 = Multi{a:1,b:true,c:null,d:null,e:null};
    self.f2 = Multi{a:2,b:false,c:"hi",d:emptyCell(),e:null};
    self.f3 = Multi{a:3,b:true,c:null,d:null,e:myAddress()};
  }
}
