struct BigStruct {
  a: Int;
  b: Int;
  c: Bool;
  d: String;
  e: Int;
  f: Bool;
  g: String;
  h: Bool;
  i: Int;
  j: String;
}

contract LargeFlat {
  big: BigStruct;

  init() {
    self.big = BigStruct{
      a:1, b:2, c:true, d:"A", e:3, f:false, g:"B", h:true, i:4, j:"C"
    };
  }
}