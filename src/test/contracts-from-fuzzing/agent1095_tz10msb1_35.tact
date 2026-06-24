struct Abcd {
  a:Int;
  b:Bool;
  c:Bool?;
  d:Int?;
}

contract ReorderTest {
  f1:Int;
  f2:Abcd;
  f3:Int?;
  f4:Bool;

  init() {
    self.f1=1;
    self.f2=Abcd{a:2,b:true,c:null,d:null};
    self.f3=null;
    self.f4=false;
  }
}