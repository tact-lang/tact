struct Wide {
  a: Int; b: Bool; c: Int?; d: Bool?; e: String;
  f: Int; g: Bool; h: Int?; i: Bool?; j: String;
  k: Int; l: Bool; m: Int?; n: Bool?; o: String;
  p: Int; q: Bool; r: Int?; s: Bool?; t: String;
}

contract TestContract {
  wide: Wide;

  init() {
    self.wide = Wide{
      a:1, b:true, c:null, d:false, e:"a",
      f:2, g:false, h:null, i:true, j:"b",
      k:3, l:true,m:100,n:null,o:"c",
      p:4,q:false,r:null,s:true,t:"d"
    };
  }
}