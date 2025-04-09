struct Sub {
  a: Int;
  b: Bool;
  o: Int?;
}

struct Contain {
  s1: Sub;
  s2: Sub;
}

contract ManyOptionalsNested {
  c: Contain;

  init() {
    self.c = Contain{
      s1: Sub{a:1,b:true,o:null},
      s2: Sub{a:2,b:false,o:42}
    };
  }
}
