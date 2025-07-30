struct Compose {
  a: Int;
  b: Inner1;
  c: Inner2;
}

struct Inner1 {
  x: String?;
  y: Bool;
}

struct Inner2 {
  m: Int?;
}

contract Test {
  data: Compose;
  init() {
    self.data = Compose{
      a: 7,
      b: Inner1{x:null, y:true},
      c: Inner2{m:null}
    };
  }
}