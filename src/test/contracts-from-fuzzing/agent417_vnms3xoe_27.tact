struct InnerMost { a: Int; }
struct Middle { b: InnerMost; }
struct OuterMost { c: Middle; }

contract NestedHuge {
  f: OuterMost;

  init() {
    self.f = OuterMost{
      c: Middle{
         b: InnerMost{ a:1234 }
      }
    };
  }
}