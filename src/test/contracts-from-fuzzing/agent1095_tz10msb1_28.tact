struct Big0 {
  a: Int;
  b: Bool;
  c: Int?;
}

struct Big1 {
  d: Big0;
  e: Int?;
  f: Bool;
}

struct Big2 {
  g: Big1;
  h: Bool?;
  i: Int;
}

contract MultiBig {
  store: Big2;

  init() {
    self.store = Big2{
      g: Big1{
        d: Big0{a:1,b:true,c:null},
        e:5,
        f:false
      },
      h:true,
      i:42
    };
  }
}