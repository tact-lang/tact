struct S1 { a: Int; b: Bool; c: String; d: Cell; e: Slice; f: Address; g: Int?; h: Bool?; i: String?; j: Cell?; k: Slice?; l: Address?; }

contract WideFields {
  s: S1;

  init() {
    self.s = S1{
      a:1,b:true,c:"x",d:emptyCell(),e:emptyCell().asSlice(),f:myAddress(),
      g:2,h:false,i:null,j:null,k:null,l:null
    };
  }
}