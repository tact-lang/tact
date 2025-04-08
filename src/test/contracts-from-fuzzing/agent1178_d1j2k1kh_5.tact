struct Many {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Int;
  h: Bool;
  i: String;
  j: Int?;
}

contract Test {
  data: Many;
  init() {
    self.data = Many{
      a:1, b:true, c:"hi", d:null, e:false, f:null,
      g:2, h:false, i:"bye", j:10,
    };
  }
}