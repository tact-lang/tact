struct B1 { b:Int; }
struct B2 { b:Bool; }
struct C1 { s:String; }

contract MultiStructFlat {
  s1:B1;
  s2:B2;
  s3:C1;
  init(){
    self.s1 = B1{b:1};
    self.s2 = B2{b:true};
    self.s3 = C1{s:"x"};
  }
}