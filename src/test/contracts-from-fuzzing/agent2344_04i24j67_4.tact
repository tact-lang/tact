struct LargeStruct {
  a: Int;
  b: Int;
  c: Bool;
  d: Int;
  e: Bool;
  f: Int;
  g: Bool;
  h: Int;
  i: Bool;
  j: Int;
}

contract LargeFields {
  big: LargeStruct;

  init() {
    self.big = LargeStruct{
      a:1, b:2, c:true, d:3, e:false, f:4, g:true, h:5, i:false, j:6,
    };
  }
}