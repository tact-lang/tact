struct BigNestA {
  a: Int;
  b: Int?;
  c: Bool;
}

struct BigNestB {
  d: Int;
  e: BigNestA;
  f: Bool?;
}

struct BigNestC {
  g: BigNestB;
  h: BigNestA;
  i: Int?;
}

contract MultiLevelNest {
  store: BigNestC;

  init() {
    self.store = BigNestC{
      g: BigNestB{
        d: 1,
        e: BigNestA{a:2,b:null,c:true},
        f: false
      },
      h: BigNestA{a:3,b:4,c:false},
      i: null
    };
  }
}