struct N {
  z: Int as uint8;
}

struct FlatMix {
 a: Int;
 b: Int?;
 c: Int as uint32;
 d: Bool;
 e: Bool?;
 f: String;
 g: String?;
 h: Int = 0;
 i: Bool = false;
 j: N;
}

contract MixAll {
 data: FlatMix;

 init() {
  self.data = FlatMix{
 a:1, b:null, c:2, d:true, e:null, f:"hi", g:null, h:3, i:true, j:N{z:4} };
 }
}