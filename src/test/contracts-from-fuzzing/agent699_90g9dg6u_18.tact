struct Multi {
    a: Int; b: String; c: Bool;
    d: Int?; e: String?; f: Bool?;
    g: Int; h: String; i: Bool;
}

contract Multimix {
    val: Multi;
    init() {
      self.val = Multi{
        a:1,b:"b",c:true,d:null,e:"e",f:false,g:2,h:"h",i:true
      };
    }
}