struct A { n: Int; }
struct B { x: Int; }
struct C { a: A; b: B; }

contract ReorderedTest {
    field: C;

    init() {
      self.field = C{
        a: A{n:1},
        b: B{x:2}
      };
    }
}