struct Multi {
 a: Int;
 b: Bool;
 c: String;
 d: Int?;
 e: Bool?;
 f: String;
 g: Int;
 h: Bool;
 i: String;
 j: Int?;
 k: Bool?;
 l: String;
 m: Int;
 n: Bool;
 o: String;
 p: Int?;
 q: Bool?;
 r: String;
 s: Int;
 t: Bool;
 u: String;
 v: Int?;
}

contract HugeStruct {
  data: Multi;

  init() {
    self.data = Multi{
      a:1, b:false, c:"", d:null, e:true, f:"a", g:2, h:true, i:"b", j:null, k:false, l:"c",
      m:3, n:false, o:"d", p:null, q:true, r:"e", s:4, t:false, u:"f", v:5,
    };
  }
}