// massive struct of various types

struct Mass {
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
  k: Bool?;
  l: String?;
  m: Int;
  n: Bool;
  o: String;
}

contract Test {
  state: Mass;

  init() {
    self.state = Mass{
      a:1, b:true, c:"a", d:null, e:false, f:null, g:2, h:true, i:"b",
      j:null, k:true, l:null, m:3, n:false, o:"c",
    };
  }
}