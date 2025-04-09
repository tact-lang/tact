struct I { a: Int }
struct J { b: Int }
struct K { c: Int }

contract NestedMulti {
  ii: I;
  jj: J;
  optK: K?;
  name: String;

  init() {
    self.ii = I{ a:1 };
    self.jj = J{ b:2 };
    self.optK = null;
    self.name = "nm";
  }
}