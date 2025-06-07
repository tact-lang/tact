struct BigStruct {
  a: Int; b: Bool; c: String; d: Cell; e: Slice;
  f: Int; g: Bool; h: String; i: Cell; j: Slice;
  k: Int; l: Bool; m: String; n: Cell; o: Slice;
  p: Int; q: Bool; r: String; s: Cell; t: Slice;
}

contract TestContract {
  bigData: BigStruct;

  init() {
    self.bigData = BigStruct{
      a:1,b:true,c:"x",d:emptyCell(),e:emptyCell().asSlice(),
      f:2,g:false,h:"y",i:emptyCell(),j:emptyCell().asSlice(),
      k:3,l:true,m:"z",n:emptyCell(),o:emptyCell().asSlice(),
      p:4,q:false,r:"w",s:emptyCell(),t:emptyCell().asSlice()
    };
  }
}