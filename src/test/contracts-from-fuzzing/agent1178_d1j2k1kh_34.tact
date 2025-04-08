// large struct with many mixed optional and primitive fields
struct Large {
  a: Int; b: Bool; c: String; d: Int?; e: String?; f: Bool?;
  g: Int; h: Bool; i: String; j: Int?; k: String?; l: Bool?;
}

contract Test {
  data: Large;
  init() {
    self.data = Large{
      a:1, b:true, c:"x", d:null, e:"y", f:null,
      g:2, h:false, i:"z", j:3, k:null, l:true
    };
  }
}