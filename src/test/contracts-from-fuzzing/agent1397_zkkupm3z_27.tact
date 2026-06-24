struct Mega {
 a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?;
 g: Int; h: Bool; i: String; j: Int?; k: Bool?; l: String?;
 m: Int; n: Bool; o: String; p: Int?; q: Bool?; r: String?;
}

contract HugeStruct {
 data: Mega;

 init() {
  self.data = Mega{
    a:1, b:true, c:"c", d:null, e:null, f:null,
    g:2, h:false, i:"i", j:null, k:null, l:null,
    m:3, n:true, o:"o", p:null, q:null, r:null
  };
 }
}