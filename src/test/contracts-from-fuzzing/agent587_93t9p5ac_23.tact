struct ManyNested {
  nest1: Nest1;
}

struct Nest1 {
  nest2: Nest2;
}

struct Nest2 {
  nest3: Nest3;
}

struct Nest3 {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
}

contract ManyNestedContract {
  n: ManyNested;

  init() {
    self.n = ManyNested{
      nest1: Nest1{
        nest2: Nest2{
          nest3: Nest3{
            a:5, b:true, c:null, d:null
          }
        }
      }
    };
  }
}
