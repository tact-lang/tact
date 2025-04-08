struct S {
  a:Int; b:Int?; c:Bool; d:String?;
}
contract ManyStorage {
    f1:S;
    f2:S;
    f3:S;
    init(){
      self.f1=S{a:1,b:null,c:true,d:"x"};
      self.f2=S{a:2,b:7,c:false,d:null};
      self.f3=S{a:3,b:null,c:true,d:null};
    }
}