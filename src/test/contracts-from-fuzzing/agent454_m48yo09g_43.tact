struct SomeStruct {
  v:Int;
}

contract Arranged {
 a:Int;
 b:SomeStruct;
 c:Bool;
 d:String;
 e:Int?;
 f:Bool?;
 g:String?;
 init() {
  self.a=1;
  self.b=SomeStruct{v:2};
  self.c=true;
  self.d="x";
  self.e=null;
  self.f=null;
  self.g=null;
 }
}