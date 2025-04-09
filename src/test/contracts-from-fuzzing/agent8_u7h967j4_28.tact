struct Inner1 { a: Int }
struct Inner2 { b: Int }
struct Inner3 { c: Int }

struct Outer {
  i1: Inner1;
  i2: Inner2;
  i3: Inner3;
}

contract MultiNested {
  data: Outer;
  init() {
    self.data = Outer{
      i1: Inner1{a:1},
      i2: Inner2{b:2},
      i3: Inner3{c:3}
    };
  }
}