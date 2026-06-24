struct BigStruct {
  a: Int; b: Bool; c: String; d: Cell; e: Slice;
  f: Int; g: Bool; h: String; i: Cell; j: Slice;
  k: Int; l: Bool; m: String; n: Cell; o: Slice;
}

contract LargeFields {
  data: BigStruct;

  init() {
    self.data = BigStruct{
      a:1, b:true, c:"c", d:emptyCell(), e:emptyCell().asSlice(),
      f:2, g:false, h:"h", i:emptyCell(), j:emptyCell().asSlice(),
      k:3, l:true, m:"m", n:emptyCell(), o:emptyCell().asSlice(),
    };
  }
}
