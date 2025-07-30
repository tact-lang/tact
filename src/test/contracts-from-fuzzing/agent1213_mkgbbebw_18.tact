struct UltraNested {
  a: Int;
  b: Int;
  c: Int;
}

struct Nest1 {
  u: UltraNested;
}

struct Nest2 {
  n: Nest1;
}

struct Nest3 {
  n: Nest2;
}

struct Nest4 {
  n: Nest3;
}

struct Nest5 {
  n: Nest4;
}

contract DeeplyNestedFields {
  val: Nest5;

  init() {
    self.val = Nest5{
      n: Nest4{
        n: Nest3{
          n: Nest2 {
            n: Nest1 {
              u: UltraNested{ a:1,b:2,c:3 }
            }
          }
        }
      }
    };
  }
}