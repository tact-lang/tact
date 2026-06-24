struct A { val: Int }
struct B { a: A }
struct C { b: B }
struct D { c: C }

contract SameDepth {
  d: D;

  init() {
    self.d = D{
      c: C{
        b: B{
          a: A{ val: 7 }
        }
      }
    };
  }
}