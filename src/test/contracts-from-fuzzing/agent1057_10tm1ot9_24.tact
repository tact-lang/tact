struct S {
  a:Int; b:Bool; c:String; d:Int?; e:Bool?; f:String?;
}

contract DefsAndOpts {
  s:S = S{a:10,b:true,c:"x",d:null,e:null,f:null};

  init() {
    self.s = S{a:1,b:false,c:"y",d:5,e:true,f:null};
  }
}