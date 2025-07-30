struct BoolMix {
 a: Bool;
 b: Bool?;
 c: Bool;
 d: Bool?;
 e: Bool;
}

contract BoolMixContract {
 s: BoolMix;
 init() {
  self.s = BoolMix{ a:true, b:null, c:false, d:true, e:false };
 }
}