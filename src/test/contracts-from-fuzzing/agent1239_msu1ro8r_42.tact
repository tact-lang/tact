struct WrapPrimitives {
  a:Int;
  b:Bool;
  c:String;
}

contract JustWrapped {
  x:WrapPrimitives;

  init(){
    self.x=WrapPrimitives{a:5,b:true,c:"ok"};
  }
}