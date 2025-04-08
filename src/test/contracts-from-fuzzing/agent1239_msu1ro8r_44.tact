contract ReorderOptional {
  a:Int?;
  b:String;
  c:Bool?;

  init(){
    self.a=5;
    self.b="y";
    self.c=null;
  }
}