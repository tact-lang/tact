struct Mix {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool;
  f: String?;
  g: Int;
  h: Bool?;
  i: String;
}

contract Test {
  data: Mix;
  init() {
    self.data = Mix{
      a:1, b:true, c:"hi", d:2, e:false, f:null,
      g:3, h:true, i:"bye",
    };
  }
}