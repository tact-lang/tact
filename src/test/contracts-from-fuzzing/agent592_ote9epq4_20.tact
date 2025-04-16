struct Many {
  a:Int; b:Int?; c:Bool; d:Bool?;
  e:String; f:String?; g:Int;
  h:String; i:Bool; j:Int?;
}

contract TestContract {
  data: Many;

  init() {
    self.data = Many{
      a:1, b:null, c:true, d:null,
      e:"e", f:null, g:2,
      h:"h", i:false, j:null
    };
  }

  receive() {}
}