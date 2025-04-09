struct Half1 {
  a: Int;
  b: Bool;
  c: String;
}

struct Half2 {
  d: Int?;
  e: Bool?;
  f: String?;
}

struct Both {
  h1: Half1;
  h2: Half2;
}

contract Test {
  combined: Both;

  init() {
    self.combined = Both{
      h1: Half1{a:1,b:true,c:"foo"},
      h2: Half2{d:null,e:null,f:null},
    };
  }
}
