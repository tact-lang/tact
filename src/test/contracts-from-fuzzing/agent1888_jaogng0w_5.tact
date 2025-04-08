struct BigStruct {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool;
  e: Int;
  f: Bool;
  g: Int?;
  h: Bool;
  i: Int;
  j: Bool;
}

contract TestBig {
  x: BigStruct;

  init() {
    self.x = BigStruct{
      a:1, b:true, c:null, d:false, e:2, f:true, g:5, h:false, i:999, j:true
    };
  }
}
