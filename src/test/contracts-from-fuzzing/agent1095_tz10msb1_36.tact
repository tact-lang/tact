struct P {
 a:Int;
 b:Bool?;
}

struct Q {
 c:P;
 d:P?;
 e:Int?;
}

contract ComboFields {
  f:Q;

  init() {
    self.f=Q{
      c:P{a:1,b:true},
      d:null,
      e:42
    };
  }
}