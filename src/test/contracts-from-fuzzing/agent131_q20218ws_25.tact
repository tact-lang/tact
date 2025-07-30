struct Crazy {
  a: Int; b: String; c: Bool?; d: Int?; e: String; f: Bool; g: Int?;
}

contract StructMix {
  s: Crazy;

  init() {
    self.s = Crazy{
      a:1,b:"x",c:null,d:null,e:"y",f:true,g:null
    };
  }
}