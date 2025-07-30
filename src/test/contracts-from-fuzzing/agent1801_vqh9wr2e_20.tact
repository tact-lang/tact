struct Big {
  a: Int; b: Int; c: Int; d: Int; e: Int; f: Int; g: Int; h: Int; i: Int; j: Int;
}

contract Massive {
  f1: Big; f2: Big; f3: Big; f4: Big; f5: Big;

  init() {
    let dummy = Big{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10};
    self.f1 = dummy;
    self.f2 = dummy;
    self.f3 = dummy;
    self.f4 = dummy;
    self.f5 = dummy;
  }
}