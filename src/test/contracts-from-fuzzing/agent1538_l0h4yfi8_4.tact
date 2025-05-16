struct Wide {
  a: Int;
  b: Bool;
  c: Int;
  d: Bool;
  e: String;
  f: Bool;
  g: Int?;
  h: Bool?;
  i: String;
  j: Int;
}

contract Test {
  big: Wide;

  init() {
    self.big = Wide{
      a:1, b:true, c:2, d:false, e:"s1", f:true, g:null, h:null, i:"s2", j:3
    };
  }
}