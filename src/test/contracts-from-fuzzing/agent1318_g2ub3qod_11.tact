struct BigMix {
  a: Int; b: Int?; c: Bool; d: Bool?; e: Address;
  f: Address?; g: Cell; h: Cell?; i: Builder; j: Builder?;
  k: Slice; l: Slice?; m: String; n: String?; o: Int;
  p: Int?; q: Bool; r: Bool?; s: String; t: String?;
}

contract Test {
  bm: BigMix;

  init() {
    self.bm = BigMix{
      a:1,b:null,c:true,d:false,e:myAddress(),
      f:null,g:emptyCell(),h:null,i:beginCell(),j:null,
      k:emptyCell().asSlice(),l:null,m:"hi",n:null,o:42,
      p:null,q:true,r:false,s:"bye",t:null
    };
  }
}