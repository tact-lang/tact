// Use of very large nested struct with many fields of mixed types
struct BigMix {
 a: Int; b: Bool; c: String; d: Int?; e: String?;
 f: Bool; g: Int; h: String; i: Bool; j: Int?;
}

contract BigMixContract {
  info: BigMix;

  init() {
    self.info = BigMix{
      a:1, b:true, c:"c", d:null, e:null,
      f:false, g:7, h:"h", i:true, j:null
    };
  }
}