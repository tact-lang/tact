struct A {
  f1:Int; f2:Bool; f3:String;
  f4:Int?; f5:Bool?; f6:String?;
}

contract MixedDeepPersistent {
  p1:A; p2:A;
  init() {
    self.p1 = A{ f1:1, f2:true, f3:"hi", f4:null, f5:false, f6:null };
    self.p2 = A{ f1:2, f2:false, f3:"bye", f4:3, f5:null, f6:"yo" };
  }
}