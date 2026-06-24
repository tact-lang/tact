struct S {
  a: Int;
  b: String;
  c: Bool;
  d: Cell;
  e: Slice;
  f: Address;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Address?;
}

contract SContract {
  s: S;

  init() {
    self.s = S{
      a:1,b:"x",c:true,d:emptyCell(),e:emptyCell().asSlice(),f:myAddress(),
      g:null,h:null,i:null,j:null
    };
  }
}