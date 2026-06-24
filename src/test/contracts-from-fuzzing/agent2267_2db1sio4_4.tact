struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }
struct Inner3 { c: String; }

struct Middle {
  x: Inner1;
  y: Inner2;
  z: Inner3;
  o1: Inner1?;
  o2: Inner2?;
}

struct Outer {
  m: Middle;
  n: Middle?;
}

contract NestedManyOptional {
  data: Outer;

  init() {
    self.data = Outer{
      m: Middle{
        x: Inner1{a:1},
        y: Inner2{b:true},
        z: Inner3{c:"hi"},
        o1: null,
        o2: null
      },
      n: null
    };
  }
}
