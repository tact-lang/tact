// contract with enormous struct of mixed types
struct Huge {
  a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice;
  g: Int?; h: Bool?; i: String?; j: Address?; k: Cell?; l: Slice?;
  m: Int; n: Bool; o: String; p: Address; q: Cell; r: Slice;
  s: Int?; t: Bool?; u: String?; v: Address?; w: Cell?; x: Slice?;
}

contract TestContract {
  data: Huge;

  init() {
    self.data = Huge{
      a:1, b:true, c:"hi", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(),
      g:null, h:null, i:null, j:null, k:null, l:null,
      m:2, n:false, o:"yo", p:myAddress(), q:emptyCell(), r:emptyCell().asSlice(),
      s:null, t:null, u:null, v:null, w:null, x:null
    };
  }
}