// contract with deeply nested complex struct including optionals and various types
struct Bottom {
  a: Int?;
  b: Bool;
  c: String?;
}

struct Middle {
  x: Bottom?;
  y: Bottom?
}

struct Top {
  m1: Middle;
  m2: Middle?;
}

contract VeryDeep {
  data: Top;

  init() {
    self.data = Top{
      m1: Middle{ x:Bottom{a:null,b:true,c:null}, y:null },
      m2: null
    };
  }
}
