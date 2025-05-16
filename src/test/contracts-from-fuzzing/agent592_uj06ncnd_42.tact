struct NestOnce {
 x: Int; y: Bool;
}

contract ManyNestOnce {
 f1:NestOnce; f2:NestOnce; f3:NestOnce;
 init(){
  self.f1=NestOnce{x:1,y:true};
  self.f2=NestOnce{x:2,y:false};
  self.f3=NestOnce{x:3,y:true};
 }
}