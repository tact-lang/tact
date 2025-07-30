struct Deeply {
  a: Int; b: Bool; c:String; d: Int?; e:String?; f:Bool;
  g:Int; h:String; i:Int?; j:Bool; k:String;
}

contract BigCombo {
  f1: Deeply;
  f2: Deeply;

  init() {
    self.f1 = Deeply{
      a:1, b:true, c:"x", d:null, e:null, f:true,
      g:10, h:"h", i:null, j:false, k:"k"
    };
    self.f2 = Deeply{
      a:2, b:false, c:"y", d:null, e:null, f:false,
      g:11, h:"hh", i:null, j:true, k:"kk"
    };
  }
}
