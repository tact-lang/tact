struct MultiOptional {
  i:Int?;
  b:Bool?;
  s:String?;
}

contract OptStructFields {
  m:MultiOptional;

  init(){
    self.m=MultiOptional{i:null,b:true,s:null};
  }
}