struct IntStringBool {
  a:Int; b:String; c:Bool;
  d:Int?; e:String?; f:Bool?;
}

contract DiffOpt {
  val: IntStringBool;

  init() {
    self.val=IntStringBool{
      a:5, b:"x", c:true, d:null, e:null, f:false
    };
  }
}