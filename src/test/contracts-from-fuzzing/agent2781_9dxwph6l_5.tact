struct BigOne {
  a: Int; b: Int?; c: Bool; d: Bool?;
  e: Int; f: Int?; g: Bool; h: Bool?;
  i: Int; j: Int?; k: Bool; l: Bool?;
  m: Int; n: Int?; o: Bool; p: Bool?;
  q: Int; r: Int?; s: Bool; t: Bool?;
}

contract Test {
  huge: BigOne = BigOne{
    a:1, b:null, c:true, d:false,
    e:2, f:999, g:true, h:null,
    i:3, j:null, k:false, l:true,
    m:4, n:null, o:false, p:null,
    q:5, r:777, s:true, t:false,
  };
}