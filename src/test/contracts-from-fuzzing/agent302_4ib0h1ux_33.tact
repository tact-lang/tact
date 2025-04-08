struct ManyOpts {
  x:Int?; y:Int?; z:Int?; w:Int?; s:String?; t:String?;
  a:Bool?; b:Bool?; c:Bool?; d:Bool?;
}

contract OptFlood {
  val: ManyOpts;

  init() {
    self.val = ManyOpts{
      x:1,y:null,z:3,w:null,s:null,t:"hi",
      a:true,b:null,c:false,d:null
    };
  }
}